extends Node2D


func _on_done_button_pressed():
	get_tree().change_scene_to_file("res://scenes/search_phase/scenes/searchphase.tscn")
