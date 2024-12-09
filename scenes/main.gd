extends Node2D
class_name Main

@onready var search_phase = $search_phase
@onready var build_phase = $build_phase

func switch_to_search_phase():
	get_transition_wall().transition_show_up()
	await get_transition_wall().transition_show_up_done
	Helper.disable_and_hide_node(build_phase)
	Helper.enable_and_show_node(search_phase)
	Global.path_tracker.clear()
	search_phase.get_node("Room")._initialize()
	
	if(Global.destination_room == null || Global.destination_room.get_number() <= 0):
		SearchPhase.create_destination_room(true)
	print("destination_room: ", Global.destination_room.get_number())
	search_phase.get_letter().set_number(Global.destination_room.get_number())
	
	var balanced: bool = Helper.tree_is_balanced(Global.tree_root)
	print("is balanced: ",balanced)
	print("is sorted: ", Helper.tree_is_sorted(Global.tree_root))

func switch_to_build_phase():
	get_transition_wall().transition_show_up()
	await get_transition_wall().transition_show_up_done
	Helper.disable_and_hide_node(search_phase)
	Helper.enable_and_show_node(build_phase)
	await get_tree().create_timer(search_phase.get_transition_time()).timeout
	get_transition_wall().transition_hide_back()

func get_dialog_system() -> Node2D:
	return $dialog_system
	
func get_transition_wall() -> Transition:
	return $TransitionWall
