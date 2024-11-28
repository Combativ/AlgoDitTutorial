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
