extends Sprite2D
class_name Letter

#getter and setter
####################################################################################################

##returns the number in the letter
func get_number() -> int:
	return int($Label.text)

##sets the number of the letter to the transferred one
func set_number(number: int) -> void:
	$Label.text = str(number)
