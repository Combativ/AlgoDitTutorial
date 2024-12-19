# This script contains methods to make life easier.

extends Node



# disable and enable a node. Makes it invisible and deactivates all of it's functionalities
func disable_and_hide_node(node:Node) -> void:
	node.set_process_mode(Node.PROCESS_MODE_DISABLED)
	node.hide()

func enable_and_show_node(node:Node) -> void:
	node.set_process_mode(Node.PROCESS_MODE_INHERIT)
	node.show()


# get all children and sub-children of a given node, returned in an array
# I did not write this myself, but edited some parts. Source can be found at:
# https://forum.godotengine.org/t/how-to-get-all-children-from-a-node/18587/2
func get_all_children(node, arr:=[], depth:=0):
	if (depth != 0):
		arr.push_back(node)
	for child in node.get_children():
		arr = get_all_children(child, arr, depth+1)
	return arr


# This is mainly used as a workaround in the 'room_item' script to virtually
# press a button, but may be used anywhere where useful
func emulate_left_mouse_button_down(pos: Vector2 = get_viewport().get_mouse_position()):
	var press = InputEventMouseButton.new()
	press.set_button_index(MOUSE_BUTTON_LEFT)
	press.set_position(pos)
	press.set_pressed(true)
	Input.parse_input_event(press)
# Addition for a full mouse click (press and release)
func emulate_left_mouse_button_click(pos: Vector2 = get_viewport().get_mouse_position()):
	var press = InputEventMouseButton.new()
	press.set_button_index(MOUSE_BUTTON_LEFT)
	press.set_position(pos)
	press.set_pressed(true)
	Input.parse_input_event(press)
	press.set_pressed(false)
	Input.parse_input_event(press)


# This method returns the SnapTargetNode the requested RoomMiniature sits in
# It returns null, if the RoomMiniature is not found in the tree
func find_SnapTargetNode_from_number(number: int) -> SnapTargetNode:
	for child in Helper.get_all_children(Global.tree_root.get_parent()):
		if (child is SnapTargetNode && child.snapTarget.snapperObject != null):
			if (child.snapTarget.snapperObject.number == number):
				return child
	return null


##returns true if the tree is balanced, 
##false otherwise
static func tree_is_balanced(tree_root: SnapTargetNode) -> bool:
	return tree_root.is_balanced()
	
##returns true if the tree is sorted,
##false otherwise 
static func tree_is_sorted(tree_root: SnapTargetNode) -> bool:
	var array: Array[int] = []
	_apply(tree_root, array)
	
	if array.size() <= 1:
		return true
	elif array[0] < array[1]:
		for i in range(array.size()-2):
			if array[i] > array[i+1]:
				return false
	else:
		for i in range(array.size()-2):
			if array[i] < array[i+1]:
				return false
	return true

##recursive function to append nodes of the tree in in-order to the array
static func _apply(tree_root: SnapTargetNode, array: Array[int]) -> void:
	if tree_root.get_left_child_node() != null:
		_apply(tree_root.get_left_child_node(), array)
	array.append(tree_root.get_number())
	if tree_root.get_right_child_node() != null:
		_apply(tree_root.get_right_child_node(), array)
	pass

##performs the Callable call, while the game is locked and cannot be 
##interacted with
signal perform_locked_end
func perform_locked(call: Callable):
	Global.build_phase.lock()
	Global.search_phase.input_lock.show()
	Global.dialog_system.lock()
	Global.sound_options_window.lock()
	
	call.call()
	
	await perform_locked_end
	Global.build_phase.release()
	Global.search_phase.input_lock.hide()
	Global.dialog_system.release()
	Global.sound_options_window.release()
	pass
