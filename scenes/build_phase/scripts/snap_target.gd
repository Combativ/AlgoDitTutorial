# This script manages snapping a Snapper object to itself and releasing it again

extends Area2D

class_name SnapTarget


signal occupied_true
signal occupied_false

var occupied: bool = false
var snapperObject = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	SignalBus.room_miniature_released_on_snap_target.connect(_on_room_miniature_released_on_snap_target)
	SignalBus.room_miniature_dragged.connect(_on_room_miniature_dragged)
	
	# This signal only comes to play if the SnapTarget is a TreeSnapTarget
	# Other SnapTarget can ignore this function
	SignalBus.snapTarget_kick_snapper.connect(_on_kick_snapper)


func _on_room_miniature_released_on_snap_target(room_miniature, snapTarget) -> void:
	if (snapTarget == self && not occupied):
		accept_snapper(room_miniature)


func _on_room_miniature_dragged(room_miniature: Variant) -> void:
	if (room_miniature == snapperObject):
		release_snapper()


# This function snaps a Snapper to this SnapTarget and does the paperwork
func accept_snapper(snapper) -> void:
	snapper.position = global_position
	snapperObject = snapper
	occupied = true
	occupied_true.emit()

# This function resets this SnapTarget to be ready to accept a new one
func release_snapper():
	snapperObject = null
	occupied = false
	occupied_false.emit()


# This function only comes to play if the SnapTarget is a TreeSnapTarget
# Other SnapTarget can ignore this function
func _on_kick_snapper(snapTarget) -> void:
	if (snapTarget == self && occupied == true):
		SignalBus.room_miniature_freed.emit(snapperObject)
		snapperObject = null
		occupied = false
