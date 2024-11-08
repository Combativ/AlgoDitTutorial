extends Node2D

@onready var room_node: SnapTargetNode
@onready var doorLeft: Node2D = $"DoorLeft"
@onready var doorRight: Node2D = $"DoorRight"
@onready var picture: Node2D = $"Picture"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	doorLeft.set_number(4)
	doorRight.set_number(5)
	picture.set_number(3)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass

####################################################################################################

func move_to_room(node: SnapTargetNode) -> void:
	self.room_node = node
	update()

func update() -> void:
	if doorLeft != null:
		doorLeft.set_door_node(self.room_node.get_left_child_node())
		doorLeft.update()
	if doorRight != null:
		doorRight.set_door_node(self.room_node.get_right_child_node())
		doorRight.update()
	picture.set_number(self.room_node.get_number())
	pass
