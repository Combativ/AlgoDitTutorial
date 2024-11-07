extends Sprite2D
##test if this describes number
class_name Number

##this is a test for the integer variable
@export var number: int = -1:
	set(num):
		number = num
	##test if this helps to describe the getter
	get:
		return number


func _init(num: int = 0) -> void:
	number = num
