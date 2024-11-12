extends Node2D
class_name SearchPhase

##stores the amount of rooms visited until the right room was found
var move_counter: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	move_counter_reset()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#switches to build_phase scene
func _on_switch_phase_button_pressed():
	get_tree().change_scene_to_file("res://scenes/build_phase/build_phase.tscn")
	
##increments the move_counter by 1
func move_counter_increment() -> void:
	move_counter += 1

##resets the move_counter to 0
func move_counter_reset() -> void:
	move_counter = 0
	
