extends Node2D
class_name SearchPhase

@onready var main = $".."
@export var transition_time: float
@onready var room: Room = $Room
@onready var letter: Letter = $Letter

####################################################################################################
func _ready() -> void:
	Global.search_phase = self


#getter and setter
####################################################################################################

##returns the letter of the search phase (bottom left corner)
func get_letter() -> Letter:
	return self.letter

##returns the room of the search phase
func get_room() -> Room:
	return self.room

##returns the of room visited the last time the search phase was used (0 if the search phase wasn´t used yet)
static func get_move_counter() -> int:
	return Global.path_tracker.size()

##returns the time the transition stays in pure black screen
func get_transition_time() -> float:
	return self.transition_time
#methods
####################################################################################################

#switches to build_phase scene
func _on_switch_phase_button_pressed():
	main.switch_to_build_phase()
	
##sets the variable destination_room to one of the rooms with the highest depth in the tree 
##or null if the tree is empty 
##if random_destination_room_generating is true the chosen room is random (room belongs to 
static func create_destination_room(random_destination_room_generating: bool) -> void:
	var room: SnapTargetNode = Global.tree_root
	if(room != null && room.get_height(room) > 1):
		var running: bool = true
		while (running):
			if(room.get_height(room.get_left_child_node()) < room.get_height(room.get_right_child_node())):
				room = room.get_right_child_node()
			#chooses path random if depth equals
			elif (random_destination_room_generating && (room.get_height(room.get_left_child_node()) == room.get_height(room.get_right_child_node()))):
				var rnd = RandomNumberGenerator.new()
				var switch = rnd.randi_range(0,1)
				if switch == 0:
					room = room.get_right_child_node()
				else:
					room = room.get_left_child_node()
			else:
				room = room.get_left_child_node()
			#stops while-loop when the deepest room is reached
			if (room.get_left_child_node() == null && room.get_right_child_node() == null):
				running = false
		Global.destination_room = room
	elif (room != null):
		Global.destination_room = room
	else:
		Global.destination_room = null

##blocks every single button of this phase (incl. switch_phase button)
func lock() -> void:
	room.lock()
	$SwitchPhase.disabled = true
	
##releases the buttons of this phase
func release() -> void: 
	room.release()
	$SwitchPhase.disabled = false

##makes the screen black for almost the time transferred 
func transition(seconds: float) -> void:
	$"../TransitionWall".transition(seconds)

##mutes all sounds of the search phase
func mute() -> void:
	self.get_room().mute()

##unmutes all sounds of the search phase
func unmute() -> void: 
	self.get_room().unmute()

##returns true if the audio player is muted, false otherwise
func is_muted() -> bool:
	return room.is_muted()
