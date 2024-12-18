extends Node2D
class_name SoundControl

@onready var storyteller_player: AudioPlayer = Global.dialog_system.get_audio_player()
@onready var special_effects_player: AudioPlayer = Global.dialog_system.get_sfx_player()
@onready var white_noise_player: AudioPlayer = $"../white_noise_player"
@onready var close_button: Button = $ColorRect/close_button
@onready var update_timer: Timer = $Timer
@onready var slow_timer: Timer = $Timer2
var count: int = 0
####################################################################################################
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	#initialize volume
	white_noise_player.set_volume(get_white_noise_volume_db())
	storyteller_player.set_volume(get_storyteller_volume_db())
	special_effects_player.set_volume(get_special_effects_volume_db())
	
	#connect voulume change mehtods
	get_total_volume_scale_control_block().get_slider().value_changed.connect(func(new_value):
		white_noise_player.set_volume(self.get_white_noise_volume_db())
		storyteller_player.set_volume(self.get_storyteller_volume_db())
		special_effects_player.set_volume(self.get_special_effects_volume_db())
	)
	
	get_white_noise_control_block().get_slider().value_changed.connect(func(new_value):
		white_noise_player.set_volume(self.get_white_noise_volume_db())
	)
	
	get_storyteller_control_block().get_slider().value_changed.connect(func(new_value):
		storyteller_player.set_volume(self.get_storyteller_volume_db())
	)
	
	get_special_effects_control_block().get_slider().value_changed.connect(func(new_value):
		special_effects_player.set_volume(self.get_special_effects_volume_db())
	)
	
	close_button.pressed.connect(func():
		var option_open_button: TextureButton = $"../option_open_button"
		option_open_button.pressed.emit()
	)
	
	#makes sure that the mute function of buttons works at the start of the game
	self.update_timer.timeout.connect(func():
		SignalBus.sound_mute_status_update.emit()
		count += 1
		print(count)
	)
	
	#dectivate update_timer after 10s
	slow_timer.timeout.connect(func():
		self.update_timer.one_shot = true
	)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#getter & setter
####################################################################################################

##returns the SoundSlider object of the total volume scale
func get_total_volume_scale_control_block() -> SoundSlider:
	return $"ColorRect/total volume scale"

##returns the SoundSlider object of the storyteller volume
func get_storyteller_control_block() -> SoundSlider:
	return $ColorRect/storyteller

##returns the SoundSlider object of the white noise volume
func get_white_noise_control_block() -> SoundSlider:
	return $"ColorRect/white noise"

##returns the SoundSlider object of the sfx volume
func get_special_effects_control_block() -> SoundSlider:
	return $ColorRect/sfx

##returns the HSlider's value of the total volume scale SoundSlider
func _get_total_volume_scale_value() -> float:
	return get_total_volume_scale_control_block().get_slider().value

##returns the calculated volume for the storyteller in dB
func get_storyteller_volume_db() -> float:
	return linear_to_db(_get_total_volume_scale_value() * get_storyteller_control_block().get_slider().value) - 80

##returns the calculated volume for the white noise in dB
func get_white_noise_volume_db() -> float:
	return linear_to_db(_get_total_volume_scale_value() * get_white_noise_control_block().get_slider().value) - 80

##returns the calculated volume for the sfx in dB
func get_special_effects_volume_db() -> float:
	return linear_to_db(_get_total_volume_scale_value() * get_special_effects_control_block().get_slider().value) - 80

#methods
####################################################################################################

##disables every button of this option gui
func lock() -> void:
	self.close_button.disabled = true
	get_special_effects_control_block().lock()
	get_storyteller_control_block().lock()
	get_total_volume_scale_control_block().lock()
	get_white_noise_control_block().lock()

##enables every button of this option gui
func release() -> void:
	self.close_button.disabled = false
	get_special_effects_control_block().release()
	get_storyteller_control_block().release()
	get_total_volume_scale_control_block().release()
	get_white_noise_control_block().release()
	pass
