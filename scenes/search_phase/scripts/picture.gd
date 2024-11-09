extends Node2D
class_name Picture

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

##sets this picture´s number to the new one
func set_number(number: int):
	label.set_text(str(number))

##returns this picture´s number (text) as a String or 
##the String "null", if the number is not set
func get_number() -> String:
	var text: String = label.get_text()
	if(text == null):
		return "null"
	return 	text
