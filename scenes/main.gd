extends Node2D
class_name Main

@onready var search_phase: SearchPhase = $search_phase
@onready var build_phase: BuildPhase = $build_phase

func switch_to_search_phase():
	var inv: Inventory = Global.current_level.get_node("Inventory")
	if(not inv.is_empty()):
		var error_window: ErrorWindow = Global.dialog_system.get_error_window()
		error_window.play_sometimes_error_sound()
		error_window.show_error("Inventar enthält noch Räume!", 2)
		return
	if(not Helper.tree_is_sorted(Global.tree_root)):
		var error_window: ErrorWindow = Global.dialog_system.get_error_window()
		error_window.play_sometimes_error_sound()
		error_window.show_error("Baum ist nicht sortiert!", 2)
		return
	if(not Helper.tree_is_balanced(Global.tree_root)):
		var error_window: ErrorWindow = Global.dialog_system.get_error_window()
		error_window.play_sometimes_error_sound()
		error_window.show_error("Baum ist nicht balanciert!", 2)
		return
	
	
	get_transition_wall().transition_show_up()
	await get_transition_wall().transition_show_up_done
	Helper.disable_and_hide_node(build_phase)
	Helper.enable_and_show_node(search_phase)
	Global.path_tracker.clear()
	search_phase.get_node("Room")._initialize()
	
	##if target_room is not set in build phase create random destination_room
	##else set destination_room to the target_rooom's new position
	if Global.current_level.target_room >= 0:
		Global.destination_room = Helper.find_SnapTargetNode_from_number(Global.current_level.target_room)
	else:
		SearchPhase.create_destination_room(true)
	print("destination_room: ", Global.destination_room.get_number())
	search_phase.get_letter().set_number(Global.destination_room.get_number())
	
	var balanced: bool = Helper.tree_is_balanced(Global.tree_root)
	print("is balanced: ",balanced)
	print("is sorted: ", Helper.tree_is_sorted(Global.tree_root))

func switch_to_build_phase(skip_animation:bool = false):
	if (skip_animation == false):
		get_transition_wall().transition_show_up()
		await get_transition_wall().transition_show_up_done
		
	Helper.disable_and_hide_node(search_phase)
	Helper.enable_and_show_node(build_phase)
	
	if (skip_animation == false):
		await get_tree().create_timer(search_phase.get_transition_time()).timeout
		get_transition_wall().transition_hide_back()

func switch_to_level_01():
	get_transition_wall().transition_show_up()
	$Title.hide()
	$LevelManager.load_level($LevelManager.LEVEL_01)
	await get_tree().create_timer(0.5)
	get_transition_wall().transition_hide_back()

func get_dialog_system() -> Node2D:
	return $dialog_system
	
func get_transition_wall() -> Transition:
	return $TransitionWall
