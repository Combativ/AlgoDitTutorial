extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.pressed.connect($"..".slide_up)
	self.pressed.connect(func(): $"..".write("Dies ist ein Text, ob das mit dem Schreiben noch funktioniiert"))
	pass # Replace with function body.
