extends Area2D

class_name RotationManager


@onready var snap_target_node: SnapTargetNode = get_parent()


func _process(delta: float) -> void:
	
	# pls dont sue me. This is the only method that worked
	if (get_local_mouse_position().x > $enter.position.x - $enter.shape.get_rect().size.x / 2
			&& get_local_mouse_position().x < $enter.position.x + $enter.shape.get_rect().size.x / 2
			&& get_local_mouse_position().y > $enter.position.y - $enter.shape.get_rect().size.y / 2
			&& get_local_mouse_position().y < $enter.position.y + $enter.shape.get_rect().size.y / 2):
		show_arrows()
	
	if (get_local_mouse_position().x > $exit.position.x + $exit.shape.get_rect().size.x / 2
			|| get_local_mouse_position().x < $exit.position.x - $exit.shape.get_rect().size.x / 2
			|| get_local_mouse_position().y > $exit.position.y + $exit.shape.get_rect().size.y / 2
			|| get_local_mouse_position().y < $exit.position.y - $exit.shape.get_rect().size.y / 2):
		hide_arrows()




func show_arrows():
	if (snap_target_node.snapTarget.occupied == true):
		$RotateLeftButton.show()
		$RotateRightButton.show()
		

func hide_arrows():
	$RotateLeftButton.hide()
	$RotateRightButton.hide()
