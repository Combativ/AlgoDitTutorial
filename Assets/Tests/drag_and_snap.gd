# This script handles the dragging and dropping, as well as sending signals on certain actions

# The functionality is based on an invisible button that registers mouse press and release
extends Area2D


var dragMask: Button # The invisible button object

var is_being_dragged: bool
var mouse_offset: Vector2 # The offset from the object center to the cursor when the object is dragged
var dragged_from_pos: Vector2 # The position from which the object was being dragged


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dragMask = $DragMask
	add_to_group("Snapper", true)
	is_being_dragged = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Set the object to the mouse's position, retaining the mouse offset
	if (is_being_dragged):
		position = get_global_mouse_position() - mouse_offset

# Start of a Drag and Drop action
func _on_button_down() -> void:
	mouse_offset = get_local_mouse_position()
	dragged_from_pos = get_global_mouse_position()
	z_index += 1 # to make it appear on top while dragging
	SignalBus.snapper_dragged.emit(self)
	is_being_dragged = true

# End of a Drag and Drop action
func _on_button_up() -> void:
	z_index -= 1 # counterpart to z_index += 1 on _on_button_down()
	var overlapping_areas = get_overlapping_areas()
	for area2d in overlapping_areas:
		if (area2d.is_in_group("SnapTarget")):
			SignalBus.snapper_released_on_snapTarget.emit(self, area2d)
			break
	is_being_dragged = false
