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
####################################################################################################
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.global_sound_manager = self
	global_white_noise_player.play()
	global_white_noise_player.finished.connect(func(): global_white_noise_player.play(0.0))
	
	#if is set: emit signal to mute every player
	if (globally_muted):
		self.reverse_global_muted_status.emit()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(globally_muted and !is_muted_global_status()):
		dialog_system.get_audio_player().mute()
		search_phase.mute()
		global_white_noise_player.mute()
		
		mute_button.texture_normal = texture_muted
	##Problem: wird die ganze Zeit entmuted
	elif (!globally_muted):
		dialog_system.get_audio_player().unmute()
		search_phase.unmute()
		global_white_noise_player.unmute()
		print("test")
		mute_button.texture_normal = texture_unmuted
	
	pass

#getter & setter
####################################################################################################

func get_globally_muted() -> bool:
	return self.globally_muted

func get_texture_unmuted() -> Texture2D:
	return self.texture_unmuted

func get_texture_muted() -> Texture2D:
	return self.texture_muted

func get_global_white_noise_player() -> AudioPlayer:
	return self.global_white_noise_player

#methods
####################################################################################################

##mutes all existing ingame sounds
##emits signal: SignalBus.sound_mute_status_update
func mute_global_status() -> void:
	globally_muted = true
	SignalBus.sound_mute_status_update.emit()

##unmutes all existing ingame sounds
##emits signal: SignalBus.sound_mute_status_update
func unmute_global_status() -> void:
	globally_muted = false
	SignalBus.sound_mute_status_update.emit()

##returns true if the entire game is muted, false otherwise
func is_muted_global_status() -> bool:
	return dialog_system.is_muted() and search_phase.is_muted() and self.global_white_noise_player.is_muted()

##switches the status of the mute_button
##emits signal: reverse_status
func switch_global_mute_status() -> void:
	globally_muted = !globally_muted

##disables all buttons within this global sound manager
func lock() -> void:
	self.mute_button.disabled = true
	
##enables all buttons within this global sound manager
func release() -> void:
	self.mute_button.disabled = false
	
