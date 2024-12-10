extends AudioStreamPlayer
class_name AudioPlayer

signal playing_started
signal playing_paused
signal playing_continued

@export var muted: bool = false
var volume: float

####################################################################################################
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	volume = volume_db
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(muted and volume_db != -80):
		self.volume_db = -80
	elif(!muted and volume_db != volume):
		self.volume_db = volume
	pass

#methods
####################################################################################################

##starts playing the transferred sound file
##emits signal: playing_started
func start_playing(path: String) -> void:
	self.stream = load(path)
	self.play()
	playing_started.emit()

##pauses the playing sound
##emits signal: playing_paused
func pause_playing() -> void:
	self.stream_paused = true
	self.playing_paused.emit()
	

##continues playing the sound
##emits signal: playing_continued
func continue_playing() -> void:
	self.stream_paused = false
	self.playing_continued.emit()
	
##dinishes playing
##emits signal: finished
func skip():
	self.finished.emit()

##mutes the soundtrack (volume_db is set to -80 dB)
func mute() -> void:
	volume = volume_db
	volume_db = -80
	self.muted = true

##unmutes the soundtrack (volume_db is set to value of volume)
func unmute() -> void:
	volume_db = volume
	self.muted = false

##returns true if the audio player is muted, false otherwise
func is_muted() -> bool:
	return self.muted
