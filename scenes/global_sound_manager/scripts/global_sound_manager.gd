extends Control
class_name SoundManager

@onready var build_phase: BuildPhase = $"../build_phase"
@onready var search_phase: SearchPhase = $"../search_phase"
@onready var dialog_system: Dialogsystem = $"../dialog_system"

@export var globally_muted: bool

var texture_unmuted: Texture2D = preload("res://scenes/global_sound_manager/art_assets/Lautsprecher.png")
var texture_muted: Texture2D = preload("res://scenes/global_sound_manager/art_assets/Durchgestrichener_Lautsprecher.png")

@onready var mute_button: TextureButton = $"(un-)mute_button"
@onready var global_white_noise_player: AudioPlayer = $global_white_noise
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
		mute_button.texture_hover = texture_unmuted
	elif (!globally_muted):
		dialog_system.get_audio_player().unmute()
		search_phase.unmute()
		global_white_noise_player.unmute()
		
		mute_button.texture_normal = texture_unmuted
		mute_button.texture_hover = texture_muted
	pass

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
