extends Node2D
class_name SoundSlider

@export var texture_unmuted: Texture2D = preload("res://scenes/sound_options_window/art_assets/sound_on_white.png")
@export var texture_muted: Texture2D = preload("res://scenes/sound_options_window/art_assets/sound_off_white.png")

@onready var mute_button: TextureButton = $TextureButton
@onready var slider: HSlider = $HSlider
@onready var label: Label = $Label

@export var text: String
@export var muted: bool

@export var slider_min_value: int = 0
@export var slider_max_value: int = 100
@export var slider_start_value: float = 1
@export var slider_step_size: float = 1

####################################################################################################

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#initialize slider settings
	self.slider.min_value = slider_min_value
	self.slider.max_value = slider_max_value
	self.slider.value = slider_start_value
	self.slider.step = slider_step_size
	#updates the lable's text to the one in the inspector
	_update_text()
	
	#on button pressed: switch mute status & emit update signal
	self.mute_button.pressed.connect(func():
		if(muted):
			unmute()
			self.mute_button.texture_normal = self.texture_unmuted
		else:
			mute()
			self.mute_button.texture_normal = self.texture_muted
	)
	
	#initialize correct button skin
	self.mute_button.pressed.emit()
	self.mute_button.pressed.emit()
	
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
func get_value() -> float:
	return slider.value

##returns the slider
func get_slider() -> HSlider:
	return self.slider

##returns the TextureButton used to mute and unmute
func get_mute_button() -> TextureButton:
	return self.mute_button

##sets the text (description) of this sound slider
func set_text(new_text: String) -> void:
	self.text = new_text
	self._update_text()

##sets the volume to the transferred one
##emits signal: self.get_slider().value_changed
func set_value(new_value: float) -> void:
	self.slider.value = new_value
	

#methods
####################################################################################################

##sets the text of this SoundSlider's label to the text stored in the sound slider
func _update_text() -> void:
	self.label.text = self.text

##returns true if the status of this button is: muted,
##false otherwise
func is_muted() -> bool:
	return muted

##sets the mute status to true
##emits signal: SignalBus.sound_mute_status_update
func mute() -> void:
	self.muted = true
	self.get_mute_button().texture_normal = self.texture_muted
	SignalBus.sound_mute_status_update.emit()

##sets the unmute status to false
##emits signal: SignalBus.sound_mute_status_update
func unmute() -> void:
	self.muted = false
	self.get_mute_button().texture_normal = self.texture_unmuted
	SignalBus.sound_mute_status_update.emit()

#TODO (animation ?)
func lock():
	self.mute_button.disabled = true
	self.slider.editable = false
	self.slider.scrollable = false

#TODO (animation weg?)
func release():
	self.mute_button.disabled = false
	self.slider.editable = true
	self.slider.scrollable = true
	pass
