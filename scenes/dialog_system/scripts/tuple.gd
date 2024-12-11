extends Node
class_name  Tuple
	
var text: String
var sound_path: String

####################################################################################################
##initialize tuple that stores the transferred values
func _init(text: String, sound_path: String) -> void:
	self.text = text
	self.sound_path = sound_path

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


#getter & setter
####################################################################################################
##returns the stored text of the tuple
func get_text() -> String:
	return self.text

##returns the sound path, stored in this tuple
func get_sound_path() -> String:
	return self.sound_path
	
##sets the stored text of this tuple to the transferred value
func set_text(new_text: String) -> void:
	self.text = new_text
