extends Node2D
class_name Room

@onready var room_node: SnapTargetNode
@onready var doorLeft: Node2D = $"DoorLeft"
@onready var doorRight: Node2D = $"DoorRight"
@onready var picture: Node2D = $"Picture"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_initialize()
	
	pass # Replace with function body.

##initializes the first room with Global.tree_root as room_node (first node to enter)
func _initialize() -> void:
	$RoomIMG.set_texture($"../Controller".ROOM_IMG)
	move_to_room(Global.tree_root)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass

####################################################################################################

##sets the door´s node to the new one and
##updates the room´s links and numbers to the new ones
func move_to_room(node: SnapTargetNode) -> void:
	self.room_node = node
	update()

##updates the room´s links and numbers to the ones of the room_node´s
func update() -> void:
	if doorLeft != null:
		doorLeft.set_door_node(self.room_node.get_left_child_node())
		doorLeft.update()
	if doorRight != null:
		doorRight.set_door_node(self.room_node.get_right_child_node())
		doorRight.update()
	picture.set_number(self.room_node.get_number())
	pass
