extends Node2D


const LEVEL_01   = preload("res://scenes/build_phase/levels/level_01.tscn")
const LEVEL_02   = preload("res://scenes/build_phase/levels/level_02_1_prolog.tscn")
const LEVEL_02_2 = preload("res://scenes/build_phase/levels/level_02_2.tscn")
const LEVEL_03   = preload("res://scenes/build_phase/levels/level_03_1_prolog.tscn")
const LEVEL_03_2 = preload("res://scenes/build_phase/levels/level_03_2.tscn")
const LEVEL_04   = preload("res://scenes/build_phase/levels/level_04.tscn")
const LEVEL_04_2 = preload("res://scenes/build_phase/levels/level_04_2.tscn")
const LEVEL_05   = preload("res://scenes/build_phase/levels/level_05.tscn")
const LEVEL_05_2 = preload("res://scenes/build_phase/levels/level_05_2_prolog.tscn")
const LEVEL_05_3 = preload("res://scenes/build_phase/levels/level_05_3.tscn")

var build_phase: Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_parent().ready
	
	build_phase = get_parent().get_node("build_phase")
	
	var level1: Node2D = LEVEL_01.instantiate()
	var level2: Node2D = LEVEL_02.instantiate()
	var level2_2: Node2D = LEVEL_02_2.instantiate()
	var level3: Node2D = LEVEL_03.instantiate()
	var level3_2: Node2D = LEVEL_03_2.instantiate()
	var level4: Node2D = LEVEL_04.instantiate()
	var level4_2: Node2D = LEVEL_04_2.instantiate()
	var level5: Node2D = LEVEL_05.instantiate()
	var level5_2: Node2D = LEVEL_05_2.instantiate()
	var level5_3: Node2D = LEVEL_05_3.instantiate()
	
	
	load_level(level1)
	await $"../TransitionWall".transition_hide_back_done
	$"../search_phase/Room".lock()
	Global.dialog_system.play_sequence(Database.A_level_01_01)
	$"../search_phase/Room/DoorLeft".release()
	await $"../search_phase/Room/DoorLeft/Hitbox & Image".pressed
	await $"../TransitionWall".transition_hide_back_done
	$"../search_phase/Room/DoorLeft".lock()
	Global.dialog_system.play_sequence(Database.A_level_01_02)
	$"../search_phase/Room/DoorRight".release()
	
	await $"../search_phase/Room/DoorRight/Hitbox & Image".pressed
	await $"../TransitionWall".transition_hide_back_done
	$"../search_phase/Room/DoorRight".lock()
	Global.dialog_system.play_sequence(Database.A_level_01_03)
	$"../search_phase/Room/DoorLeft".release()
	
	await $"../search_phase/Room/DoorLeft/Hitbox & Image".pressed
	await $"../TransitionWall".transition_hide_back_done
	$"../search_phase/Room".lock()
	Global.dialog_system.play_sequence(Database.A_level_01_04)
	await Global.dialog_system.sequence_finished
	Global.dialog_system.play_sequence(Database.A_level_01_05)
	await Global.dialog_system.sequence_finished
	Global.dialog_system.play_sequence(Database.A_level_01_06)
	$"../search_phase/Room/Picture".release()
	
	await $"../search_phase/Room/Picture/Hitbox & Image".pressed
	await $"../TransitionWall".transition_hide_back_done
	$"../search_phase/Room".lock()
	
	$"../search_phase/Letter".show()
	Global.dialog_system.play_sequence(Database.A_level_01_07)
	$"../search_phase/Room/DoorLeft".release()
	
	await $"../search_phase/Room/DoorLeft/Hitbox & Image".pressed
	await $"../TransitionWall".transition_hide_back_done
	$"../search_phase/Room".lock()
	Global.dialog_system.play_sequence(Database.A_level_01_08)
	$"../search_phase/Room/DoorLeft".release()
	
	await $"../search_phase/Room/DoorLeft/Hitbox & Image".pressed
	await $"../TransitionWall".transition_hide_back_done
	$"../search_phase/Room".lock()
	$"../search_phase/Room/DoorLeft".release()
	
	await $"../search_phase/Room/DoorLeft/Hitbox & Image".pressed
	await $"../TransitionWall".transition_hide_back_done
	$"../search_phase/Room".lock()
	Global.dialog_system.play_sequence(Database.A_level_01_09)
	$"../search_phase/Room/DoorRight".release()
	
	await $"../search_phase/Room/DoorRight/Hitbox & Image".pressed
	await $"../TransitionWall".transition_hide_back_done
	$"../search_phase/Room".lock()
	Global.dialog_system.play_sequence(Database.A_level_01_10)
	$"../search_phase/Room/Picture".release()
	
	await $"../search_phase/Room/Picture/Hitbox & Image".pressed
	
	
	
	
	
	load_level(level2)
	await $"../TransitionWall".transition_hide_back_done
	Global.dialog_system.play_sequence(Database.A_level_02_01)
	await Global.dialog_system.sequence_finished
	
	load_level(level2_2)
	await $"../TransitionWall".transition_hide_back_done
	Global.dialog_system.play_sequence(Database.A_level_02_02)
	await Global.dialog_system.sequence_finished
	
	while (!Global.current_level.inventory.is_empty() || !Helper.tree_is_sorted(Global.tree_root) || Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)):
		await get_tree().create_timer(0.1).timeout
	Global.dialog_system.play_sequence(Database.A_level_02_03)
	for child in Helper.get_all_children(Global.tree_root.get_parent()):
		if child is SnapTargetNode && child.snapTarget.snapperObject != null:
			child.snapTarget.snapperObject.lock()
	
	await $"../build_phase/DoneButton".pressed
	await $"../TransitionWall".transition_show_up_done
	$"../search_phase/Room/DoorRight/DoorNumber".hide()
	$"../search_phase/Room/DoorLeft/DoorNumber".hide()
	await $"../TransitionWall".transition_hide_back_done
	Global.dialog_system.play_sequence(Database.A_level_02_04)
	
	
	await SignalBus.picture_right_room
	load_level(level3)
	
	
	
	await SignalBus.level_finished
	load_level(level3_2)
	await SignalBus.level_finished
	load_level(level4)
	await SignalBus.level_finished
	load_level(level4_2)
	await SignalBus.level_finished
	load_level(level5)
	await SignalBus.level_finished
	load_level(level5_2)
	await SignalBus.level_finished
	load_level(level5_3)





func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("ui_focus_next")):
		SignalBus.level_finished.emit()



func load_level(level: Node2D):
	get_parent().switch_to_build_phase()
	for child in build_phase.get_children():
		if child is Level:
			child.queue_free()
	
	Global.destination_room = null
	build_phase.add_child(level)
	build_phase.move_child(level, 0)
