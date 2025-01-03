extends Node2D
class_name Picture

@onready var label: Label = $PictureNumber
@onready var hitbox: TextureButton = $"Hitbox & Image"
@onready var number_background: ColorRect = $ColorRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#getters & setters
####################################################################################################

##returns this picture´s number (text) as a String or 
##the String "null", if the number is not set
func get_number() -> String:
	var text: String = label.get_text()
	if(text == null):
		return "null"
	return 	text
	
##returns the TextureButton of this picture
func get_hitbox() -> TextureButton:
	return hitbox

##sets this picture´s number to the new one
func set_number(number: int):
	label.set_text(str(number))

#methods
####################################################################################################
	
##when pressed the picture sends out signals:
##when in Global.destination_room: SignalBus.picture_right_room
##else: SignalBus.picture_wrong_room
func _on_hitbox_pressed():
	if(int(self.get_number()) == Global.destination_room.get_number()):
		SignalBus.picture_right_room.emit()
		print("destination room reached")
	else:
		SignalBus.picture_wrong_room.emit()
		print("destiniation not reached yet")
		
##blocks every button of this object
## disabled = true
func lock() -> void:
	$"Hitbox & Image".disabled = true
	
##releases the buttons (buttons can be used again)
## disabled = false
func release() -> void:
	$"Hitbox & Image".disabled = false
