class_name DragAndSnap

extends Button


var master

var is_being_dragged: bool
var mouse_offset: Vector2
var dragged_from_pos: Vector2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	master = get_parent()
	is_being_dragged = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (is_being_dragged):
		master.position = get_global_mouse_position() - mouse_offset


func _on_button_down() -> void:
	mouse_offset = master.get_local_mouse_position()
	dragged_from_pos = get_global_mouse_position()
	is_being_dragged = true


func _on_button_up() -> void:
	var overlapping_areas = get_parent().get_overlapping_areas()
	for area in overlapping_areas:
		if (area.is_in_group("SnapTarget")):
			master.position = area.position
	is_being_dragged = false
