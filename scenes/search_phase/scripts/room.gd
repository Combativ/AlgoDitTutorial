extends Node2D
class_name Room

@onready var room_node: SnapTargetNode
@onready var doorLeft: Node2D = $"DoorLeft"
@onready var doorRight: Node2D = $"DoorRight"
@onready var picture: Node2D = $"Picture"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$RoomIMG.set_texture($"../Controller".ROOM_IMG)
	SignalBus.picture_wrong_room.connect(self.return_to_spawn_room)
	pass 

##initializes the first room with Global.tree_root as room_node (first node to enter)
func _initialize() -> void:
	move_to_room(Global.tree_root)
	
#methods
####################################################################################################

##sets the door´s node to the new one and
##updates the room´s links and numbers to the new ones
##adds the room, to move in, to Global.path_tracker
func move_to_room(node: SnapTargetNode) -> void:
	self.room_node = node
	Global.path_tracker.append(self.room_node)
	$"../".transition($"..".transition_time)
	await $"../../TransitionWall".transition_show_up_done
	update()

##updates the room´s links and numbers to the ones of the room_node´s
##enables button of the piture if in the destination_room
func update() -> void:
	if doorLeft != null:
		doorLeft.set_door_node(self.room_node.get_left_child_node())
		doorLeft.update()
	if doorRight != null:
		doorRight.set_door_node(self.room_node.get_right_child_node())
		doorRight.update()
	picture.set_number(self.room_node.get_number())
	pass

##blocks every button of this object
## disabled = true
func lock() -> void:
	$DoorLeft.lock()
	$DoorRight.lock()
	$Picture.lock()
	
##releases the buttons (buttons can be used again)
## disabled = false
func release() -> void:
	$DoorLeft.release()
	$DoorRight.release()
	$Picture.release()

func return_to_spawn_room() -> void:
	self.move_to_room(Global.tree_root)
