extends Node2D
class_name Dialogsystem

##emits, when skip_key is pressed (once per press)
signal skip
##emits, when the writing animation has finished or got skipped
signal writing_done

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
	#SignalBus.picture_right_room.connect(slide_up)
	#SignalBus.picture_wrong_room.connect(slide_down)
	#SignalBus.picture_right_room.connect(test)
	Global.dialog_system = self
	pass
	
func _process(delta: float) -> void:
	#connecting and disconnecting skip operation
	if writing && !skip.is_connected(skip_text):
		skip.connect(skip_text)
	elif !writing && skip.is_connected(skip_text):
		skip.disconnect(skip_text)
	
	#writing animation
	if writing && index !=  self.text.length()-1:
		write_next()
	elif writing:
			working = false
			writing = false
			writing_done.emit()
	
	#skip input logic
	if Input.is_key_pressed(self.skip_key) && !key_pressed:
		key_pressed = true
		skip.emit()
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
func write_next() -> void:
	if(self.text != null && self.index <= self.text.length()-1):
		self.set_text(self.get_text_box().get_text() + self.text[self.index])
		index += 1

##TODO delete this method
##just a test-text
func test() -> void:
	print("test linked")
	var s: String = "hallo, das ist ein Test, wie lange das Schreiben dauert."
	write(s)
	await writing_done
	await skip
	write("""Das ist alles so viel Spaßßßßßß jljö aökfjd ölkfajö
lfkaö lkdfj öalkfj eölkafö lk fälklk jföalkdj fölkjadöflkjöal djfökajfd ökjaö dfljaölk djfölaj
kja ödlkföalkdf ölakm eölmaö lödkaj ölkjcoi jaölk dflkamd öflmaökljü bjöalkd ölkaföl jdfölkjaödfjaekmadmf l,adkjadlkfjäalm e.,maä d mävpjaüplem äfaölm ädm fäapovüpoea äöflmaädölmfä a füpoejaäpm aäölcä völäeapofäöalmdöm väaövm äp aoejf äölamdälm äcölvm äökaäpoj fäölamsd fäö lam ädvöj oräaöle- ,my- lpcjpaojäflma döfmal,ä ölfkapito kma epoj +rapowmföla,mdflkmvpü oae äfalmf-as dväo laksm-f ,am sd-f mö oaiwejf äölmfa -dsöd fjadlf kjölkdajf lkjdfö alkjföldajfölkem- a,rm- er,marem äalkjfädjpaov j#ak fömea-r,mae-r,mäakdf jäakvjäp oaj äekfm 
aösdlmf- alk efä dk#poakcvä ölaäölm -f eöalf""")

##skips writing animation and shows the entire text in the text_box instandly
##emits signal: writing_done
func skip_text() -> void:
	set_text(self.text)
	self.index = self.text.length()-1

##slides up the dialog system
func slide_up() -> void:
	operations.append(Operation.SLIDE_UP)
	
##slides down the dialog system
func slide_down() -> void:
	operations.append(Operation.SLIDE_DOWN)
