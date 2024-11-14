# This script handles everything related to the inventory, including
# -moving "freed" RoomMiniatures back into the inventory
# -dropping RoomMiniatures int othe inventory
# -dragging RoomMiniatures out of the inventory

extends Control


# Creating a reference to the "RoomItem" Scene for later use
const ROOM_ITEM = preload("res://scenes/build_phase/scenes/room_item.tscn")

# This variable controls how many RoomMiniatures the level will have
@export var inventory_size = 20

# This HBoxContainer is the one storing all RoomItems
@onready var itemContainer: HBoxContainer = $MarginContainer/ScrollContainer/RoomItemContainer


func _ready() -> void:
	SignalBus.room_miniature_freed.connect(_on_room_miniature_freed)

	# fill the inventory with RoomItems at the start
	for i in range(1, inventory_size + 1):
		add_room_item(i)


# This method is called, when a RoomMiniature was "kicked" from the tree
# (i.e. by removing a RoomMiniature that had RoomMiniature below it)
# This method adds the freed RoomMiniature as RoomItem to the inventory
func _on_room_miniature_freed(room_miniature) -> void:
	add_room_item(room_miniature.number)
	room_miniature.queue_free()



func add_room_item(room_number: int):
	var roomItem = ROOM_ITEM.instantiate()
	roomItem.room_number = room_number
	itemContainer.add_child(roomItem)
