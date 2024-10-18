# This class can be attached to any CollisionObject to make it a SnapTarget, meaning
# "Snapper" objects can snap to it.
# This script makes sure that only one object can be snapped to a SnapTarget at once
# and emits a signal to the Control object to update the scene hierarchy

class_name SnapTarget

extends Area2D


var occupied: bool = false
var snapperObject = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("SnapTarget", true)
	SignalBus.snapper_released_on_snapTarget.connect(_on_snapper_released_on_snapTarget)
	SignalBus.snapper_dragged.connect(_on_snapper_dragged)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_snapper_released_on_snapTarget(snapper, snapTarget) -> void:
	if (snapTarget == self && not occupied):
		snapper.position = position
		snapperObject = snapper
		occupied = true


func _on_snapper_dragged(snapper: Variant) -> void:
	if (snapper == snapperObject):
		snapperObject = null
		occupied = false
