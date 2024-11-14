# This script handles the dragging and dropping, as well as
# sending signals after certain actions. The functionality is based on an
# invisible button that registers mouse press and release
extends Area2D

class_name RoomMiniature


# The number of the room. This may be set in the inspector.
@export var number: int = -1

var is_being_dragged: bool
var dragged_from: Vector2 = position
var zindex = z_index


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	update_number()
	is_being_dragged = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Set the RoomMiniature to the mouse's position, retaining the mouse offset
	if (is_being_dragged):
		position = get_global_mouse_position()


func _on_drag_mask_button_down() -> void:
	initiate_drag()

func _on_drag_mask_button_up() -> void:
	end_drag()


# Start of a Drag and Drop action
func initiate_drag():
	z_index = zindex + 1 # to make it appear on top while dragging
	dragged_from = position
	SignalBus.room_miniature_dragged.emit(self)
	is_being_dragged = true

# End of a Drag and Drop action
func end_drag():
	
	# if RoomMiniature is released on a SnapTarget, then snap
	var overlapping_areas = get_overlapping_areas()
	if (!overlapping_areas.is_empty()):
		for area2d in overlapping_areas:
			
			# snap to SnapTarget
			if (area2d is SnapTarget):
				SignalBus.room_miniature_released_on_snap_target.emit(self, area2d)
				# counterpart to z_index = zindex + 1 on initiate_drag()
				z_index = zindex
				break
			
		is_being_dragged = false
	else: # else move it back to inventory
		SignalBus.room_miniature_freed.emit(self)
	

func update_number():
	$Label.text = str(number)
