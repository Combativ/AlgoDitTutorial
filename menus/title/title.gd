extends Node2D

@onready var play_button: Button = $PlayButton
@onready var quit_button: Button = $QuitButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play_button.pressed.connect(_on_play_button_pressed)
	quit_button.pressed.connect(func(): get_tree().quit())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
