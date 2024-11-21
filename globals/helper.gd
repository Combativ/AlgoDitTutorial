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


##returns true if the tree is balanced, 
##false otherwise
static func tree_is_balanced(tree_root: SnapTargetNode) -> bool:
	return tree_root.is_balanced()
