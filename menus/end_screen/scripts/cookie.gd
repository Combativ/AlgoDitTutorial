extends AnimatedSprite2D

func _on_area_2d_mouse_entered() -> void:
	play("blink")


func _on_area_2d_mouse_exited() -> void:
	play("normal")
