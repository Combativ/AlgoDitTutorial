extends Node2D

var roomNode;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

#TODO if button is pressed: go to the room with the number
func _on_button_door_left_pressed() -> void:
	pass # Replace with function body.

#TODO if button is pressed: go to the room with the number
func _on_button_door_right_pressed() -> void:
	pass # Replace with function body.

#TODO if button is pressed and the value equals the searched one:
# go to evaluation
# otherwise do nothing
func _on_button_picture_pressed() -> void:
	get_tree().change_scene_to_file("res://Assets/Tests/Joran/build_phase.tscn")
	
