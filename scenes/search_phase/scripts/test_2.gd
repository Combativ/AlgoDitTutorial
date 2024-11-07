extends Node2D

#var door = Door.new(100, 100, 5)

@export var button: TextureButton



func _ready() -> void:
	#door.show()
	button = TextureButton.new()
	button.texture_normal = preload("res://icon.svg")
	button.texture_hover = preload("res://icon_small.svg")
	button.position.x = 200
	button.position.y = 200
	add_child(button)
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if button.ACTION_MODE_BUTTON_PRESS:
		pass
