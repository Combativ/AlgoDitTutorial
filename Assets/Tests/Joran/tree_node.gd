# This script handles the hiding and showing of the TreeNode children as well as signaling
# to the snappers to snap back to the invontory, when their parent is removed

extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# TreeSnapTarget is also a SnapTarget
	add_to_group("SnapTarget", true)
	
	# hide TreeSnapTarget children on start
	for child in get_children():
		if child.is_in_group("SnapTarget"):
			Helper.disable_and_hide_node(child)
	
	



func _on_snap_target_script_occupied_true() -> void:
	# show direct TreeSnapTarget children
	for child in get_children():
		if child.is_in_group("SnapTarget"):
			Helper.enable_and_show_node(child)


func _on_snap_target_script_occupied_false() -> void:
	# Hide all TreeSnapTarget children and sub-children send a signal to them kick their Snappers
	for snapTarget in Helper.get_all_children(self):
		if (snapTarget.is_in_group("SnapTarget") && snapTarget.is_class("Area2D")):
			
			SignalBus.snapTarget_kick_snapper.emit(snapTarget)
			Helper.disable_and_hide_node(snapTarget)



func getLeftChildNumber() -> int:
	return get_child(0).find_child("SnapTargetScript").snapperObject.find_child("drag_and_snap_script").number

func getRightChildNumber() -> int:
	return get_child(1).find_child("SnapTargetScript").snapperObject.find_child("drag_and_snap_script").number

func getSelfNumber() -> int:
	return find_child("SnapTargetScript").snapperObject.find_child("drag_and_snap_script").number
