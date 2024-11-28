extends Node2D
class_name Dialogsystem

var up: bool 			= false
var down: bool		 	= false
##distacne the text_box will travel using slide methods
@export var distance: int 	= 255
var counter_up: int 	= self.distance
var counter_down: int 	= self.distance
##number of pixels traveled every operation
@export var speed: int 			= 4
var location: Mode 		= Mode.NEUTRAL

##logical switches for animation control
var working: bool 		= false
var writing: bool		= false

##data for logic of the text_box 
var text: String		= ""
var index: int			= 0

##status of the position of the text_box
enum Mode {DOWN, NEUTRAL, UP}

####################################################################################################
#controls the movement of the dialog system
func _physics_process(delta: float) -> void:
	if up && location != Mode.UP:
		position.y += speed
		counter_up -= speed
		
	elif up:
		up = false
		
	if counter_up <= 0:
		counter_up = distance
		up = !up
		location += 1
		working = false
		
	if down && location != Mode.DOWN:
		position.y -= speed
		counter_down -= speed
	elif down:
		down = false
		
	if counter_down <= 0:
		counter_down = distance
		down = !down
		location -= 1
		working = false

func _ready() -> void:
	SignalBus.picture_right_room.connect(slide_down)
	SignalBus.picture_wrong_room.connect(slide_up)
	
	SignalBus.picture_right_room.connect(test)
	
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
	await !working
	working = true
	self.up = true
	
##slides down the dialog system
func slide_down() -> void:
	await !working
	working = true
	self.down = true
	
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
	await  !working
	working = true
	writing = true
	clear()
	self.text = text
	self.index = 0

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
