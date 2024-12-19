extends Node2D
class_name Dialogsystem

##emits, when skip_key is pressed (once per press)
signal skipped
##emits, when the writing animation has finished or got skipped
signal writing_done
##emits, when the sequence of tuples is done playing
signal sequence_finished

var up: bool 				= false
var down: bool		 		= false
##distacne the text_box will travel using slide methods
@export var distance: int 	= 255
@onready var counter: int 	= self.distance
##number of pixels traveled every operation
@export var speed: int 		= 20

##status of the position of the text_box
enum Mode {DOWN, NEUTRAL, UP}
##location of the text_box
var location: Mode 			= Mode.NEUTRAL

#logical switches for animation control
var working: bool 			= false
var writing: bool			= false

#data for logic of the text_box 
var text: String			= ""
var index: int				= 0

##operations the dialogsystem can execute
enum Operation {SLIDE_UP, SLIDE_DOWN, WRITE}

##queue of operations that have to be executed 
var operations: Array[Operation] 	= []
##queue of text that will be written by the write-operation
var texts: Array[String] 			= []

##if true: skip key is pressed
var key_pressed: bool
@export var skip_key: Key

@onready var audio_player: AudioPlayer = $Storyteller_player
@onready var sfx_player: AudioPlayer = $Special_effects_player
####################################################################################################

#controls the movement of the dialog system
func _physics_process(delta: float) -> void:
	if !working && !operations.is_empty():
		var op: Operation = operations.pop_front()
		working = true
		if op == Operation.SLIDE_UP:
			up = true
		elif op == Operation.SLIDE_DOWN:
			down = true
		elif op == Operation.WRITE:
			writing = true
			clear()
			self.index = 0
			self.text = texts.pop_front()
		else:
			working = false
	
	if up && location != Mode.UP:
		get_text_box().position.y -= speed
		counter -= speed
	elif up:
		up = false
		working = false
		
	if up && counter <= 0:
		counter = distance
		up = false
		location += 1
		working = false
		
	if down && location != Mode.DOWN:
		get_text_box().position.y += speed
		counter -= speed
	elif down:
		down = false
		working = false
		
	if down && counter <= 0:
		counter = distance
		down = false
		location -= 1
		working = false
	
	if location == Mode.NEUTRAL:
		clear()

func _ready() -> void:
	Global.dialog_system = self
	pass
	
func _process(delta: float) -> void:
	#connecting and disconnecting skip operation
	if writing && !skipped.is_connected(skip_text):
		skipped.connect(skip_text)
	elif !writing && skipped.is_connected(skip_text):
		skipped.disconnect(skip_text)
	
	#writing animation
	if writing && index !=  self.text.length()-1:
		_write_next()
	elif writing:
			working = false
			writing = false
			writing_done.emit()
	
	#skip input logic
	if Input.is_key_pressed(self.skip_key) && !key_pressed:
		key_pressed = true
		self.get_audio_player().skip()
		skipped.emit()
	elif !Input.is_key_pressed(self.skip_key) && key_pressed:
		key_pressed = false
		
#getter and setter
####################################################################################################

##returns the database which stores all Strings used in the dialog system
func get_database() -> Node:
	return $Database

##returns the dialog system´s text_box
func get_text_box() -> Node2D:
	return $Text_box

##returns the speed value
func get_speed() -> int:
	return self.speed

##returns the distance the text_box is sliding
func get_distance() -> int:
	return self.distance

##returns the key, that is used to skip the writing animation of the text_box
func get_skip_key() -> Key:
	return self.skip_key

##returns this system's audio player of the storyteller voice lines
func get_audio_player() -> AudioPlayer:
	return self.audio_player

##returns this system's audio player for special effects
##this one cannot be skipped
func get_sfx_player() -> AudioPlayer:
	return self.sfx_player

##returns this system's error window
func get_error_window() -> ErrorWindow:
	return $ErrorWindow

##returns this system's task window
func get_task_window() -> TaskWindow:
	return $TaskWindow

##sets the text of it´s text_box to the transferred text
func set_text(text: String) -> void:
	$Text_box.set_text(text)

##sets the speed to the transferred value
##(px per operation)
func set_speed(px: int) -> void:
	self.speed = px

##sets the distance to the transferred value 
##distance the text_box travels when slide_up() of slide_down() is called
func set_distance(size: int) -> void:
	self.distance = size
	
##set the skip_key to skip writing animation to the transferred one
func set_skip_key(key: Key) -> void:
	self.skip_key = key

##sets the text in the task window to the transferred one
func set_task(task: String) -> void:
	self.get_task_window().task.text = task

#methods
####################################################################################################

##sets the text to none 
func clear() -> void:
	set_text("")

##writes text in text_box with writing animation
##emits signal: writing_done when writing animation is finished
func write(text: String) -> void:
	operations.append(Operation.WRITE)
	texts.append(text)

##writes next character of self.text in text_box
func _write_next() -> void:
	if(self.text != null && self.index <= self.text.length()-1):
		self.set_text(self.get_text_box().get_text() + self.text[self.index])
		index += 1

##skips writing animation and shows the entire text in the text_box instandly
##emits signal: writing_done
func skip_text() -> void:
	set_text(self.text)
	self.index = self.text.length()-1

##skips the writing animation and the voice track
##emits signal: self.skipped
##emits signal: self.get_audio_player().finished
func skip() -> void:
	self.skip_text()
	self.get_audio_player().skip()

##locks the scenes and slides up the text_box
##plays a single couple of text and speech
##emits signal: self.writing_done when the wrtie animation finishes
##emits signal: self.get_audio_player().finished when the voice track finishes or is skipped
##slides down the text_box and releases the scenes
func play(couple: Tuple) -> void:
	var array: Array[Tuple] = [couple]
	self.play_sequence(array)
	pass

##locks the scenes and slides up the text_box
##plays all couples of text and speech of the array in order, waits for skip-key-input after every couple
##emits signal: self.writing_done whenever the wrtie animation finishes
##emits signal: self.get_audio_player().finished whenever the voice track finishes or is skipped
##emits signal: self.sequence_finished when the sequence is done playing
##slides down the text_box and releases the scenes
func play_sequence(couple_array: Array[Tuple]) -> void:
	
	Helper.perform_locked(func():
		
		self.slide_up()
	
		for i in range(len(couple_array)):
			self.write(couple_array[i].get_text())
			self.audio_player.stream = couple_array[i].get_sound()
			self.audio_player.play()
			
			await self.writing_done
			await self.get_audio_player().finished
			##player input
			await self.skipped
			
		self.slide_down()
		Helper.perform_locked_end.emit()
		self.sequence_finished.emit()
		
	)
	pass

##plays only the sound of the transferred tuple
##emits signal: self.get_audio_player().finished when finished playing the sound track
func play_sound(couple: Tuple) -> void:
	var arr: Array[Tuple] = [couple]
	play_sound_sequence(arr)

##plays all sounds of the transferred tuples in order 
##emits signal: self.get_audio_player().finished whenever finished playing one sound track
func play_sound_sequence(couples: Array[Tuple]) -> void:
	Helper.perform_locked(func():
		var sound: AudioStream
		for tuple in couples:
			sound = tuple.get_sound()
			audio_player.stream = sound
			audio_player.play()
			await audio_player.finished
		Helper.perform_locked_end
	)
	pass

##slides up the dialog system
func slide_up() -> void:
	operations.append(Operation.SLIDE_UP)
	
##slides down the dialog system
func slide_down() -> void:
	operations.append(Operation.SLIDE_DOWN)

##mutes the dialog system's audio
func mute() -> void:
	get_audio_player().mute()
	get_sfx_player().mute()

##unmutes the dialog system's audio
func unmute() -> void:
	get_audio_player().unmute()
	get_sfx_player().unmute()

##returns true if the entire dialog system is muted, false otherwise
func is_muted() -> bool:
	return get_audio_player().is_muted() and get_sfx_player().is_muted()

##deactivates buttons of this dialog system
func lock() -> void:
	self.get_task_window().lock()

##reactivates buttons of this dialog system
func release() -> void:
	self.get_task_window().release()
