extends Node2D
class_name SearchPhase

@onready var main = $".."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#switches to build_phase scene
func _on_switch_phase_button_pressed():
	main.switch_to_build_phase()
	

##returns the of room visited the last time the search phase was used (0 if the search phase wasn´t used yet)
static func get_move_counter() -> int:
	return Global.path_tracker.size()
	
##sets the variable destination_room to one of the rooms with the highest depth in the tree 
##or null if the tree is empty 
static func create_destination_room() -> void:
	var room: SnapTargetNode = Global.tree_root
	if(room != null):
		var running: bool = true
		while (running):
			if(room.get_height(room.get_left_child_node()) < room.get_height(room.get_right_child_node())):
				room = room.get_right_child_node()
			else:
				room = room.get_left_child_node()
			#stops while-loop when the deepest room is reached
			if (room.get_left_child_node() == null && room.get_right_child_node() == null):
				running = false
		Global.destination_room = room
	else:
		Global.destination_room = null

##blocks every single button of this phase (incl. switch_phase button)
func block() -> void:
	$Room.block()
	$SwitchPhase.disabled = true
	
##releases the buttons of this phase
func release() -> void: 
	$Room.release()
	$SwitchPhase.disabled = false
