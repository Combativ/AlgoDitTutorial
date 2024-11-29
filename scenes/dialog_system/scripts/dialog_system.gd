extends Node2D
class_name Dialogsystem

var up: bool 				= false
var down: bool		 		= false
##distacne the text_box will travel using slide methods
@export var distance: int 	= 255
var counter: int 		= self.distance
##number of pixels traveled every operation
@export var speed: int 		= 20
var location: Mode 			= Mode.NEUTRAL

##logical switches for animation control
var working: bool 			= false
var writing: bool			= false

##data for logic of the text_box 
var text: String			= ""
var index: int				= 0

##operations the dialogsystem can execute
enum Operation {SLIDE_UP, SLIDE_DOWN, WRITE}

##queue of operations that have to be executed 
var operations: Array[Operation] 	= []
##queue of text that will be written by the write-operation
var texts: Array[String] 			= []

##status of the position of the text_box
enum Mode {DOWN, NEUTRAL, UP}

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
		position.y += speed
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
		position.y -= speed
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
	SignalBus.picture_right_room.connect(slide_down)
	SignalBus.picture_wrong_room.connect(slide_up)
	SignalBus.picture_right_room.connect(test)
	pass
	
func _process(delta: float) -> void:
	if writing:
		write_next()
		if self.index == self.text.length()-1:
			working = false
			writing = false
			

####################################################################################################

##returns the database which stores all Strings used in the dialog system
func get_database() -> Node:
	return $Database

##returns the dialog system´s text_box
func get_text_box() -> Node2D:
	return $Text_box

##sets the text of it´s text_box to the transferred text
func set_text(text: String) -> void:
	$Text_box.set_text(text)

##slides up the dialog system
func slide_up() -> void:
	operations.append(Operation.SLIDE_UP)
	
##slides down the dialog system
func slide_down() -> void:
	operations.append(Operation.SLIDE_DOWN)
	
##returns the speed value
func get_speed() -> int:
	return self.speed

##sets the speed to the transferred value
##(px per operation)
func set_speed(px: int) -> void:
	self.speed = px

##returns the distance the text_box is sliding
func get_distance() -> int:
	return self.distance
	
##sets the distance to the transferred value 
##distance the text_box travels when slide_up() of slide_down() is called
func set_distance(size: int) -> void:
	self.distance = size
	
##sets the text to none 
func clear() -> void:
	set_text("")

##writes text in text_box with writing animation
func write(text: String) -> void:
	operations.append(Operation.WRITE)
	texts.append(text)

##writes next character of self.text in text_box
func write_next() -> void:
	if(self.text != null && self.index <= self.text.length()-1):
		self.set_text(self.get_text_box().get_text() + self.text[self.index])
		index += 1

##just a test-text
func test() -> void:
	print("test linked")
	var s: String = "hallo, das ist ein Test, wie lange das Schreiben dauert."
	write(s)
	write("Das ist alles so viel Spaßßßßßß")
