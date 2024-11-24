extends Node2D
class_name Dialogsystem

var up: bool 			= false
var down: bool		 	= false
var counter_size: int 	= 255
var counter_up: int 	= self.counter_size
var counter_down: int 	= self.counter_size
var speed: int 			= 1
var location: Mode 		= Mode.NEUTRAL
var working: bool 		= false

var text: String		= ""
var index: int			= 0

enum Mode {DOWN, NEUTRAL, UP}

####################################################################################################
#controls the movement of the dialog system
func _physics_process(delta: float) -> void:
	if up && location != Mode.UP:
		position.y += speed
		counter_up -= 1
		
	elif up:
		up = false
		
	if counter_up <= 0:
		counter_up = counter_size
		up = !up
		location += 1
		working = false
		
	if down && location != Mode.DOWN:
		position.y -= speed
		counter_down -= 1
	elif down:
		down = false
		
	if counter_down <= 0:
		counter_down = counter_size
		down = !down
		location -= 1
		working = false

func _ready() -> void:
	SignalBus.picture_right_room.connect(slide_down)
	SignalBus.picture_wrong_room.connect(slide_up)
	
	SignalBus.picture_right_room.connect(test)
	
func _process(delta: float) -> void:
	if self.index <= self.text.length()-1:
		write_next()

####################################################################################################

##returns the database which stores all Strings used in the dialog system
func get_database() -> Node:
	return $Database

##returns the dialog system´s text box
func get_text_box() -> Node2D:
	return $Text_box

##sets the text of it´s text box to the transferred text
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

##returns the counter size
func get_counter_size() -> int:
	return self.counter_size
	
##sets the counter size to the transferred value 
##amount of operations should execute
func set_counter_size(size: int) -> void:
	self.counter_size = size
	
##sets the text to none 
func clear() -> void:
	set_text("")

##writes text in text_box with writing animation
func write(text: String) -> void:
	clear()
	self.text = text
	self.index = 0

##writes next character of self.text in text_box
func write_next() -> void:
	if(self.text != null && self.index <= self.text.length()-1):
		self.set_text(self.get_text_box().get_text() + self.text[self.index])
		print(self.get_text_box().get_text() + self.text[self.index])
		index += 1

func test() -> void:
	print("test linked")
	var s: String = "hallo, das ist ein Test, wie lange das Schreiben dauert."
	write(s)
