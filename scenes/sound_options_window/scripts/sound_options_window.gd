extends Node2D
class_name SoundOptionsWindow

var texture_muted: Texture2D = preload("res://scenes/sound_options_window/art_assets/sound_off.png")
var texture_unmuted: Texture2D = preload("res://scenes/sound_options_window/art_assets/sound_on.png")

@onready var storyteller_player: AudioPlayer = Global.dialog_system.audio_player
@onready var sfx_player: AudioPlayer = Global.dialog_system.sfx_player
@onready var white_noise_player: AudioPlayer = $white_noise_player
@onready var global_mute_button: TextureButton = $global_mute_button
@onready var option_open_button: TextureButton = $option_open_button
@onready var sound_controller: SoundControl = $sound_control
####################################################################################################

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.sound_options_window = self
	#initialize correct texture for status
	if (get_mute_status_global()):
		global_mute_button.texture_normal = self.texture_muted
	else:
		global_mute_button.texture_normal = self.texture_unmuted
	
	#connect open button to open option window
	option_open_button.pressed.connect(func():
		sound_controller.visible = not sound_controller.visible
	)
	
	#connect global mute button (original) to change texture of this mute button (duplicate)
	self.get_sound_control().get_total_volume_scale_control_block().get_mute_button().pressed.connect(func():
		if(get_mute_status_global()):
			global_mute_button.texture_normal = texture_muted
		else:
			global_mute_button.texture_normal = texture_unmuted
	)
	
	#connect mute_button (dupicate) to press: global mute button (original)
	self.global_mute_button.pressed.connect(func():
		self.get_sound_control().get_total_volume_scale_control_block().get_mute_button().pressed.emit()
	)
	
	#when sound mute status update signal emits: update mute status of every audio player
	SignalBus.sound_mute_status_update.connect(func():
		if(get_mute_status_storyteller()):
			storyteller_player.mute()
		else:
			storyteller_player.unmute()
		
		if(get_mute_status_white_noise()):
			white_noise_player.mute()
		else:
			white_noise_player.unmute()
		
		if(get_mute_status_sfx()):
			sfx_player.mute()
		else:
			sfx_player.unmute()
		pass
	)
	#start playing of the white noise
	white_noise_player.play()
	white_noise_player.finished.connect(func():
		white_noise_player.play()
	)
	
	sfx_player.stream = load("res://scenes/sound_options_window/sounds/WhiteNoise2.wav")
	sfx_player.play()
	sfx_player.finished.connect(func():
		sfx_player.play()
	)

	storyteller_player.stream = load("res://scenes/sound_options_window/sounds/WhiteNoise3.wav")
	storyteller_player.play()
	storyteller_player.finished.connect(func():
		storyteller_player.play()
	)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#getter & setter
####################################################################################################

##returns the game's white noise player
func get_white_noise_player() -> AudioPlayer:
	return self.white_noise_player

##returns the button used to open the options menu (gui)
func get_option_open_button() -> TextureButton:
	return self.option_open_button

##returns the button used to mute and unmute all sounds at once
func get_global_mute_button() -> TextureButton:
	return self.global_mute_button

##returns true if the game is globally muted,
##false otherwise
func get_mute_status_global() -> bool:
	return sound_controller.get_total_volume_scale_control_block().is_muted()

##returns true if the storyteller's audio player is muted (global mute considered),
##false otherwise
func get_mute_status_storyteller() -> bool:
	return (sound_controller.get_storyteller_control_block().is_muted() or 
			sound_controller.get_total_volume_scale_control_block().is_muted())

##returns true if the white noise's audio player is muted (global mute considered),
##false otherwise
func get_mute_status_white_noise() -> bool:
	return (sound_controller.get_white_noise_control_block().is_muted() or 
			sound_controller.get_total_volume_scale_control_block().is_muted())

##returns true if the audio player for special effects is muted (global mute considered),
##false otherwise
func get_mute_status_sfx() -> bool:
	return (sound_controller.get_special_effects_control_block().is_muted() or
			sound_controller.get_total_volume_scale_control_block().is_muted())

##returns the sound controller of this window
func get_sound_control() -> SoundControl:
	return self.sound_controller

##sets the global mute status to the transferred value
##true -> muted
##false -> unmuted
func set_mute_status_global(status: bool) -> void:
	var control_block: SoundSlider = sound_controller.get_total_volume_scale_control_block()
	if(status):
		control_block.mute()
	else:
		control_block.unmute()

##sets the storyteller's mute status to the transferred value
##true -> muted
##false -> unmuted
func set_mute_status_storyteller(status: bool) -> void:
	var control_block: SoundSlider = sound_controller.get_storyteller_control_block()
	if(status):
		control_block.mute()
	else:
		control_block.unmute()

##sets the white noise's mute status to the transferred value
##true -> muted
##false -> unmuted
func set_mute_status_white_noise(status: bool) -> void:
	var control_block: SoundSlider = sound_controller.get_white_noise_control_block()
	if(status):
		control_block.mute()
	else:
		control_block.unmute()

##sets the audio player's mute status for special effects to the transferred value
##true -> muted
##false -> unmuted
func set_mute_status_sfx(status: bool) -> void:
	var control_block: SoundSlider = sound_controller.get_total_volume_scale_control_block()
	if(status):
		control_block.mute()
	else:
		control_block.unmute()

#methods
####################################################################################################

##disables all buttons of this sound option window
func lock() -> void:
	self.get_global_mute_button().disabled = true
	self.get_option_open_button().disabled = true
	self.get_sound_control().lock()

##enables all buttons of this sound option window
func release() -> void:
	self.get_global_mute_button().disabled = false
	self.get_option_open_button().disabled = false
	self.get_sound_control().release()
