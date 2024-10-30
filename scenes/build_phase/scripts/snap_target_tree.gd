# This script handles the hiding and showing of the TreeNode children as well as
# coordinating RoomMiniatures

extends Node2D

class_name SnapTargetTree


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("SnapTargetTree", true)
	
	$SnapTarget.occupied_true.connect(_on_snap_target_occupied_true)
	$SnapTarget.occupied_false.connect(_on_snap_target_occupied_false)
	
	# hide SnapTargetTree children on start
	for child in get_children():
		if child.is_in_group("SnapTargetTree"):
			Helper.disable_and_hide_node(child)
	



func _on_snap_target_occupied_true() -> void:
	# show direct TreeSnapTarget children
	for child in get_children():
		if child is SnapTargetTree:
			Helper.enable_and_show_node(child)


func _on_snap_target_occupied_false() -> void:
	# Hide all SnapTargetTree children and sub-children and
	# release their RoomMiniatures
	for child in get_children():
		if (child is SnapTargetTree):
			if (child.find_child("SnapTarget").occupied == true):
				child.release_room_miniature()
			Helper.disable_and_hide_node(child)


func release_room_miniature():
	var temp_room_miniature = $SnapTarget.snapperObject
	$SnapTarget.release_snapper()
	SignalBus.room_miniature_freed.emit(temp_room_miniature)


func getLeftChildNumber() -> int:
	return get_child(0).find_child("SnapTarget").snapperObject.number

func getRightChildNumber() -> int:
	return get_child(1).find_child("SnapTarget").snapperObject.number

func getSelfNumber() -> int:
	return find_child("SnapTarget").snapperObject.number
