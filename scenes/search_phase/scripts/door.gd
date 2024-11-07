extends Node2D, Controller
class_name Door

@onready var door_number: Label = $"DoorNumber/PictureNumber"
@onready var door_hitbox: TextureButton = $"Hitbox & Image"

####################################################################################################
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	door_hitbox.set_texture_normal(preload($))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

####################################################################################################

func set_number(number: int):
	door_number.set_text(str(number))
	
func get_number() -> int:
	return int(door_number.get_text())
	
