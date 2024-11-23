# This script handles the hiding and showing of the SnapTargetNode children
# as well as coordinating RoomMiniatures

extends Node2D

class_name SnapTargetNode

# This variable is used to manually assign a snapper object to the SnapTarget node
# in the editor. The variable is used in the _ready() function.
@export var snapTarget_snapperObject: RoomMiniature


# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	$SnapTarget.occupied_true.connect(_on_snap_target_occupied_true)
	$SnapTarget.occupied_false.connect(_on_snap_target_occupied_false)
	
	# hide SnapTargetNode children on start
	for child in get_children():
		if child is SnapTargetNode:
			Helper.disable_and_hide_node(child)
	
	# assign snapper object to SnapTarget if desired
	if (snapTarget_snapperObject != null):
		$SnapTarget.accept_snapper(snapTarget_snapperObject)
		
	



func _on_snap_target_occupied_true() -> void:
	# show direct TreeSnapTarget children
	for child in get_children():
		if child is SnapTargetNode:
			Helper.enable_and_show_node(child)


func _on_snap_target_occupied_false() -> void:
	# Hide all SnapTargetNode children and sub-children and
	# release their RoomMiniatures
	for child in get_children():
		if (child is SnapTargetNode):
			if (child.get_node("SnapTarget").occupied == true):
				child.release_room_miniature()
			Helper.disable_and_hide_node(child)


func release_room_miniature():
	var temp_room_miniature = $SnapTarget.snapperObject
	$SnapTarget.release_snapper()
	SignalBus.room_miniature_freed.emit(temp_room_miniature)


# methods to navigate the tree

##returns the left child if it exists
##null otherwise
func get_left_child_node() -> SnapTargetNode:
	if (get_node_or_null("lChild") != null && get_node("lChild").get_node("SnapTarget").snapperObject != null):
		return get_node("lChild") # returns reference to left or right SnapTargetNode
	else:
		return null

##returns the right child if it exists
##null otherwise
func get_right_child_node() -> SnapTargetNode:
	if (get_node_or_null("rChild") != null && get_node("rChild").get_node("SnapTarget").snapperObject != null):
		return get_node("rChild") # returns reference to left or right SnapTargetNode
	else:
		return null

##returns the parent if it exists
##null otherwise
func get_parent_node() -> SnapTargetNode:
	if (get_parent() is SnapTargetNode):
		return get_parent() # returns reference to parent SnapTargetNode
	else:
		return null

# methods to access properties of the tree
func get_number() -> int:
	if (get_node("SnapTarget").snapperObject != null):
		return get_node("SnapTarget").snapperObject.number
	else:
		return -1


# I didn't write this method myself. I copied it from this website:
# https://favtutor.com/blogs/binary-tree-height
# I am not responsible for any errors
func get_height(node: SnapTargetNode = self) -> int:
	var result: int = -1
	
	var queue: Array[SnapTargetNode]
	
	if node == null:
		return result
	
	queue.append(node)
	
	while(!queue.is_empty()):
		var current_size: int = queue.size()
		
		while current_size > 0:
			var current_node: SnapTargetNode = queue.pop_front()
			current_size -= 1
			
			if (current_node.get_left_child_node() != null):
				queue.append(current_node.get_left_child_node())
			if (current_node.get_right_child_node() != null):
				queue.append(current_node.get_right_child_node())
		
		result += 1
	return result

##returns true if this (sub-) tree is balanced, false otherwise
func is_balanced() -> bool:
	var right: bool
	var left: bool 
	
	if(self.get_right_child_node() != null):
		right = self.get_right_child_node().is_balanced()
	else:
		right = true
	
	if(self.get_left_child_node() != null):
		left = self.get_left_child_node().is_balanced()
	else:
		left = true
	
	var hight_left: int = self.get_height(self.get_left_child_node())
	var hight_right: int = self.get_height(self.get_right_child_node())
	
	return right && left && (abs(hight_left - hight_right) < 2)


# insert a RoomMiniature into the tree at its sorted position
func insert_sorted(room: RoomMiniature) -> bool:
	var insertion_success: bool = true
	
	var right_subtree: SnapTargetNode = get_node_or_null("rChild")
	var left_subtree: SnapTargetNode = get_node_or_null("lChild")
	
	if ($SnapTarget.occupied == false):
		$SnapTarget.accept_snapper(room)
		room.z_index = room.zindex # counterpart to z_index = zindex + 1 on initiate_drag()
		room.is_being_dragged = false
	elif (room.number < get_number() && left_subtree != null):
		left_subtree.insert_sorted(room)
	elif (room.number > get_number() && right_subtree != null):
		right_subtree.insert_sorted(room)
	else:
		SignalBus.room_miniature_freed.emit(room)
		insertion_success = false
	
	return insertion_success
	
