extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.pressed.connect($"..".slide_down)
	pass # Replace with function body.
