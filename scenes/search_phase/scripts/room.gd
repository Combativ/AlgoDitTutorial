extends Node2D
class_name Room

@onready var room_node: SnapTargetNode
@onready var doorLeft: Node2D = $"DoorLeft"
@onready var doorRight: Node2D = $"DoorRight"
@onready var picture: Node2D = $"Picture"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$RoomIMG.set_texture($"../Controller".ROOM_IMG)
	_initialize()
	
	pass # Replace with function body.

##initializes the first room with Global.tree_root as room_node (first node to enter)
func _initialize() -> void:
	move_to_room(Global.tree_root)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass

####################################################################################################

##sets the door´s node to the new one and
##updates the room´s links and numbers to the new ones
##adds the room, to move in, to Global.path_tracker
func move_to_room(node: SnapTargetNode) -> void:
	self.room_node = node
	Global.path_tracker.append(self.room_node)
	#print(Global.path_tracker)
	update()


##updates the room´s links and numbers to the ones of the room_node´s
##enables button of the piture if in the destination_room
##TODO !! button is not disabled anymore and not gets rested
func update() -> void:
	if doorLeft != null:
		doorLeft.set_door_node(self.room_node.get_left_child_node())
		doorLeft.update()
	if doorRight != null:
		doorRight.set_door_node(self.room_node.get_right_child_node())
		doorRight.update()
	picture.set_number(self.room_node.get_number())
	if(room_node == Global.destination_room):
		var button: TextureButton = self.picture.get_hitbox()
		button.disabled = false
	pass
