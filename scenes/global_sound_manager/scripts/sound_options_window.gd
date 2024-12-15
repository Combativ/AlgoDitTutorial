extends Node2D
class_name SoundOptionsWindow

@onready var option_open_button: TextureButton = $option_open_button
@onready var option_gui: OptionGUI = $option_gui
####################################################################################################

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#getter & setter
####################################################################################################

func get_option_open_button() -> TextureButton:
	return self.option_open_button

func get_option_gui() -> OptionGUI:
	return self.option_gui


#methods
####################################################################################################

##disables all buttons of this sound option window
func lock() -> void:
	self.get_option_open_button().disabled = true
	self.get_option_gui().lock()

##enables all buttons of this sound option window
func release() -> void:
	self.get_option_open_button().disabled = false
	self.get_option_gui().release()
