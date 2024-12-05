extends Node2D


@onready var main = $".."

func _on_done_button_pressed():
	main.switch_to_search_phase()

# disable user input
func lock():
	$InputLock.show()
# enable user input
func release():
	$InputLock.hide()

# DEBUG
func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("ui_left")):
		print(Helper.find_SnapTargetNode_from_RoomMiniature(Global.current_level.target_room))
