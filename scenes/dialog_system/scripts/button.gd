extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.pressed.connect($"..".slide_up)
	self.pressed.connect(tuple)
	pass # Replace with function body.

func tuple():
	print($"..".get_database().test_tuple.get_text())
	print($"..".get_database().test_tuple.get_sound_path())
