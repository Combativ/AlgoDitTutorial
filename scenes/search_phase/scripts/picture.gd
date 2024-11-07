extends Node2D

@onready var label: Label = $PictureNumber
@onready var hitbox: TextureButton = $"Hitbox & Image"
@onready var number_background: ColorRect = $ColorRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#Getters & Setters
####################################################################################################

func set_number(number: int):
	label.set_text(str(number))

func get_number() -> String:
	var text = label.get_text()
	if(text == null):
		return "number is null"
	return 	text
