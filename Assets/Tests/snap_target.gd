# This class can be attached to any CollisionObject to make it a SnapTarget, meaning
# "Snapper" objects can snap to it.
# This script makes sure that only one object can be snapped to a SnapTarget at once

class_name SnapTargetScript

extends Node


signal occupied_true
signal occupied_false

var master
var occupied: bool = false
var snapperObject = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	master = get_parent()
	
	master.add_to_group("SnapTarget")
	SignalBus.snapper_released_on_snapTarget.connect(_on_snapper_released_on_snapTarget)
	SignalBus.snapper_dragged.connect(_on_snapper_dragged)
	
	# This signal only comes to play if the SnapTarget is a TreeSnapTarget
	# Other SnapTarget can ignore this function
	SignalBus.snapTarget_kick_snapper.connect(_on_kick_snapper)


func _on_snapper_released_on_snapTarget(snapper, snapTarget) -> void:
	if (snapTarget == master && not occupied):
		accept_snapper(snapper)


func _on_snapper_dragged(snapper: Variant) -> void:
	if (snapper == snapperObject):
		snapperObject = null
		occupied = false
		
		occupied_false.emit()


# This function snaps a Snapper to this SnapTarget and does the paperwork
func accept_snapper(snapper) -> void:
	snapper.position = master.global_position
	snapperObject = snapper
	occupied = true
	
	occupied_true.emit()


# This function only comes to play if the SnapTarget is a TreeSnapTarget
# Other SnapTarget can ignore this function
func _on_kick_snapper(snapTarget) -> void:
	if (snapTarget == master && occupied == true):
		SignalBus.snapper_freed.emit(snapperObject)
		snapperObject = null
		occupied = false
