extends Control
class_name SoundManager

@onready var build_phase: BuildPhase = Global.build_phase
@onready var search_phase: SearchPhase = Global.search_phase
@onready var dialog_system: Dialogsystem = Global.dialog_system

@export var globally_muted: bool

var texture_unmuted: Texture2D = preload("res://scenes/global_sound_manager/art_assets/sound_on.png")
var texture_muted: Texture2D = preload("res://scenes/global_sound_manager/art_assets/sound_off.png")

@onready var mute_button: TextureButton = $"(un-)mute_button"
@onready var global_white_noise_player: AudioPlayer = $global_white_noise
@onready var sound_options_window: SoundOptionsWindow = $sound_options_window
####################################################################################################
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mute_button.pressed.connect(switch_status)
	global_white_noise_player.play()
	global_white_noise_player.finished.connect(func(): global_white_noise_player.play(0.0))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(globally_muted and !is_muted()):
		dialog_system.get_audio_player().mute()
		search_phase.mute()
		global_white_noise_player.mute()
		
		mute_button.texture_normal = texture_muted
	elif (!globally_muted):
		dialog_system.get_audio_player().unmute()
		search_phase.unmute()
		global_white_noise_player.unmute()
		
		mute_button.texture_normal = texture_unmuted
	pass

#getter & setter
####################################################################################################

func get_sound_options_window() -> SoundOptionsWindow:
	return self.sound_options_window

func get_texture_unmuted() -> Texture2D:
	return self.texture_unmuted

func get_texture_muted() -> Texture2D:
	return self.texture_muted

#methods
####################################################################################################

##mutes all existing ingame sounds
func mute() -> void:
	globally_muted = true

##unmutes all existing ingame sounds
func unmute() -> void:
	globally_muted = false

##returns true if the entire game is muted, false otherwise
func is_muted() -> bool:
	return dialog_system.is_muted() and search_phase.is_muted()

##switches the status of the mute_button
func switch_status() -> void:
	self.globally_muted = !globally_muted

##disables all buttons within this global sound manager
func lock() -> void:
	self.mute_button.disabled = true
	self.sound_options_window.lock()

##enables all buttons within this global sound manager
func release() -> void:
	self.mute_button.disabled = false
	self.sound_options_window.release()
