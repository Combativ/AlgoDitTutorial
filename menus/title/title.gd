extends Node2D

@onready var play_button: Button = $PlayButton
@onready var quit_button: Button = $QuitButton
@onready var main: Main = $".."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play_button.pressed.connect(main.switch_to_level_01)
	quit_button.pressed.connect(func(): get_tree().quit())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
