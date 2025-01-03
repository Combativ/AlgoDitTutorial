# This script handles converting RoomItems to RoomMiniatures, when the player
# drags one out from the inventory
# When the button registers a mouse click, the RoomItem is replaced with a
# RoomMiniature and the RoomItem deletes itself 

extends PanelContainer

# preload the RoomMiniature Scene to instantiate it later
const ROOM_MINIATURE = preload("res://scenes/build_phase/scenes/room_miniature.tscn")

# the room numbers will be set by the inventory script when generating the RoomItems
var room_number = -1

@onready var room_miniature_container: Node2D = $"../../../../../RoomMiniatureContainer"

func _ready() -> void:
	$RoomNumberLabel.text = str(room_number)


func _on_mouse_trigger_button_down() -> void:
	var room_miniature = ROOM_MINIATURE.instantiate()
	room_miniature.number = room_number
	
	# add RoomMiniature to the scene
	room_miniature_container.add_child(room_miniature)
	
	# trigger a drag action on this RoomMiniature
	Helper.emulate_left_mouse_button_down(room_miniature.global_position)
	
	# delete self (the item) from the inventory
	queue_free()
