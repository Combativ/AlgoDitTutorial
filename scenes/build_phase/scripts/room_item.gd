# This script handles converting RoomItems to RoomMiniatures, when the player
# drags one out from the inventory
# When the button registers a mouse click, the RoomItem is replaced with a
# RoomMiniature and the RoomItem deletes itself 

extends PanelContainer

# the room numbers will be set by the inventory script when generating the RoomItems
var room_number = -1

# preload the RoomMiniature Scene to instantiate it later
const ROOM_MINIATURE = preload("res://scenes/build_phase/room_miniature.tscn")


func _ready() -> void:
	$RoomNumberLabel.text = str(room_number)


func _on_mouse_trigger_button_down() -> void:
	var room_miniature = ROOM_MINIATURE.instantiate()
	room_miniature.number = room_number
	
	# add RoomMiniature to the scene
	get_tree().current_scene.add_child(room_miniature)
	room_miniature.initiate_drag()
	
	# delete self from the inventory
	queue_free()