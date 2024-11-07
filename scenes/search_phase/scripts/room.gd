extends Node2D

@onready var doorLeft: Node2D = $"DoorLeft"
@onready var doorRight: Node2D = $"DoorRight"
@onready var picture: Node2D = $"Picture"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	doorLeft.set_number(4)
	doorRight.set_number(5)
	picture.set_number(3)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass

####################################################################################################
