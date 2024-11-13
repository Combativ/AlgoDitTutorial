extends Node2D

@onready var search_phase = $search_phase
@onready var build_phase = $build_phase

func switch_to_search_phase():
	Helper.disable_and_hide_node(build_phase)
	Helper.enable_and_show_node(search_phase)
	search_phase.get_node("Room")._initialize()

func switch_to_build_phase():
	Helper.disable_and_hide_node(search_phase)
	Helper.enable_and_show_node(build_phase)
