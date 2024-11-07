
class_name Room extends Node2D

var leftDoor: Door 
var rightDoor: Door
var picture: Picture

func _init(leftDoor: Door, rightDoor: Door, picture: Picture) -> void:
	self.leftDoor = leftDoor
	self.rightDoor = rightDoor
	self.picture = picture
	


#TODO if button is pressed: go to the room with the number
func _on_button_door_left_pressed() -> void:
	pass # Replace with function body.

#TODO if button is pressed: go to the room with the number
func _on_button_door_right_pressed() -> void:
	pass # Replace with function body.

#TODO if button is pressed and the value equals the searched one:
# go to evaluation
# otherwise do nothing
func _on_button_picture_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/build_phase/build_phase.tscn")
	
