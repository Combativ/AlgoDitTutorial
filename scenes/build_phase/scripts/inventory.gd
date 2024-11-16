# This script handles everything related to the inventory, including
# -moving "freed" RoomMiniatures back into the inventory
# -dragging RoomMiniatures out of the inventory

extends Control


# Creating a reference to the "RoomItem" Scene for later use
const ROOM_ITEM = preload("res://scenes/build_phase/scenes/room_item.tscn")

# This variable controls the RoomMiniatures the player has in his inventory in
# this level. It is only used for manual manipulation in the inspector.
@export var inventory: Array[RoomMiniature] = []

# This HBoxContainer is the one storing all RoomItems
@onready var itemContainer: HBoxContainer = $MarginContainer/ScrollContainer/RoomItemContainer


func _ready() -> void:
	SignalBus.room_miniature_freed.connect(_on_room_miniature_freed)

	# fill the inventory with RoomItems at the start
	for room_miniature in inventory:
		if room_miniature != null:
			add_room_item(room_miniature.number)
			room_miniature.queue_free()



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
