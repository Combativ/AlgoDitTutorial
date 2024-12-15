extends Node2D
class_name SoundSlider

var texture_unmuted: Texture2D = Global.global_sound_manager.get_texture_unmuted()
var texture_muted: Texture2D = Global.global_sound_manager.get_texture_muted()

@onready var mute_button: TextureButton = $TextureButton
@onready var slider: HSlider = $HSlider
@onready var label: Label = $Label

@export var text: String
@export var muted: bool = false

####################################################################################################

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_update_text()
	if(muted):
		self.mute_button.texture_normal = self.texture_muted
	else:
		self.mute_button.texture_normal = self.texture_unmuted
	
	self.mute_button.pressed.connect(func():
		self.muted = !self.muted
		if(muted):
			self.mute_button.texture_normal = self.texture_muted
		else:
			self.mute_button.texture_normal = self.texture_unmuted
	)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#getter & setter 
####################################################################################################

##returns the text (description) of this sound slider
func get_text() -> String:
	return self.text

##returns the value of the slider
func get_volume() -> float:
	return slider.value

##returns the slider
func get_slider() -> HSlider:
	return self.slider

##sets the text (description) of this sound slider
func set_text(new_text: String) -> void:
	self.text = new_text
	self._update_text()

##sets the volume to the transferred one
##emits signal: self.get_slider().value_changed
func set_volume(new_volume: float) -> void:
	self.slider.volume = new_volume
	

#methods
####################################################################################################

##sets the text of this SoundSlider's label to the text stored in the sound slider
func _update_text() -> void:
	self.label.text = self.text

#returns true if the status of this button is: muted,
##false otherwise
func is_muted() -> bool:
	return muted
