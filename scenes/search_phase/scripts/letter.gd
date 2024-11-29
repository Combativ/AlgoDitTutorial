extends Sprite2D
class_name Letter

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

##returns the number in the letter
func get_number() -> int:
	return int($Label.text)

##sets the number of the letter to the transferred one
func set_number(number: int) -> void:
	$Label.text = str(number)
