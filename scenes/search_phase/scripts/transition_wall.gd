extends ColorRect
class_name Transition

##emits when transition animation is done (from transparent to black)
signal transition_show_up_done
##emits when transition animation is done (from black to transparent)
signal transition_hide_back_done

##speed, how fast the animation is (without waiting time)
##intervall: (0,1]
@export var darkening_speed: float

var b: bool = true
var sig: bool = false

####################################################################################################
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	modulate.a = 0
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if b && sig:
		add_transparency()
	elif (!b) && sig:
		sub_transparency()

#methods
####################################################################################################

##makes rectangle transparent
func add_transparency():
	if self.modulate.a > 0:
		self.modulate.a -= darkening_speed
		return true
	else: 
		self.sig = false
		b = !b
		transition_hide_back_done.emit()

##makes rectangle visible
func sub_transparency():
	if self.modulate.a < 1:
		self.modulate.a += darkening_speed
		return false
	else: 
		self.sig = false
		b = !b
		transition_show_up_done.emit()
		
##creates a transition that lasts almost the transferred time in seconds
func transition(seconds: float) -> void:
	transition_show_up()
	await transition_show_up_done
	await get_tree().create_timer(seconds).timeout
	transition_hide_back()

##runs the transition until the screen is covered in black
##emits signal: transition_show_up_done when animation is done
##shows by it´s own
func transition_show_up() -> void:
	self.show()
	b = false
	sig = true

##runs the transition from black sreen to uncovered screen
##emits signal: transition_hide_back_done when animation is done
##hides by it´s own
func transition_hide_back() -> void:
	b = true
	sig = true
	await transition_hide_back_done
	self.hide()
