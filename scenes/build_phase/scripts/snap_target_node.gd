# This script handles the hiding and showing of the TreeNode children as well as
# coordinating RoomMiniatures

extends Node2D

class_name SnapTargetNode


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("SnapTargetNode", true)
	
	$SnapTarget.occupied_true.connect(_on_snap_target_occupied_true)
	$SnapTarget.occupied_false.connect(_on_snap_target_occupied_false)
	
	# hide SnapTargetNode children on start
	for child in get_children():
		if child.is_in_group("SnapTargetNode"):
			Helper.disable_and_hide_node(child)
	



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
			if (child.find_child("SnapTarget").occupied == true):
				child.release_room_miniature()
			Helper.disable_and_hide_node(child)


func release_room_miniature():
	var temp_room_miniature = $SnapTarget.snapperObject
	$SnapTarget.release_snapper()
	SignalBus.room_miniature_freed.emit(temp_room_miniature)


# methods to navigate the tree
func get_left_child_node():
	if (find_child("lChild").find_child("SnapTarget").snapperObject != null):
		return find_child("lChild") # returns reference to left or right SnapTargetNode
	else:
		return null

func get_right_child_node():
	if (find_child("rChild").find_child("SnapTarget").snapperObject != null):
		return find_child("rChild") # returns reference to left or right SnapTargetNode
	else:
		return null

func get_parent_node():
	if (get_parent() is SnapTargetNode):
		return get_parent() # returns reference to parent SnapTargetNode
	else:
		return null

func get_number() -> int:
	if (find_child("SnapTarget").snapperObject != null):
		return find_child("SnapTarget").snapperObject.number
	else:
		return -1
