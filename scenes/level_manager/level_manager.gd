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
var task_label: RichTextLabel

# level 3 needs to know the last inserted room
var room_number_just_inserted: int = -1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_parent().ready
	
	build_phase = get_parent().get_node("build_phase")
	task_label = $"../dialog_system/TaskWindow/RichTextLabel"
	
	SignalBus.room_miniature_released_on_snap_target.connect(_on_roomMiniature_released_on_snapTarget)
	
	
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
	
	# hide task window for the first level
	$"../dialog_system/TaskWindow".hide()
	
	load_level(level1)
	await $"../TransitionWall".transition_hide_back_done
	$"../search_phase/Room".lock()
	Global.dialog_system.play_sequence(Database.A_level_01_01)
	$"../search_phase/Room/DoorLeft".release()
	await $"../search_phase/Room/DoorLeft/Hitbox & Image".pressed
	await $"../TransitionWall".transition_show_up_done
	$"../search_phase/Room/DoorLeft".lock()
	await $"../TransitionWall".transition_hide_back_done
	Global.dialog_system.play_sequence(Database.A_level_01_02)
	$"../search_phase/Room/DoorRight".release()
	
	await $"../search_phase/Room/DoorRight/Hitbox & Image".pressed
	await $"../TransitionWall".transition_show_up_done
	$"../search_phase/Room/DoorRight".lock()
	await $"../TransitionWall".transition_hide_back_done
	Global.dialog_system.play_sequence(Database.A_level_01_03)
	$"../search_phase/Room/DoorLeft".release()
	
	await $"../search_phase/Room/DoorLeft/Hitbox & Image".pressed
	await $"../TransitionWall".transition_show_up_done
	$"../search_phase/Room".lock()
	await $"../TransitionWall".transition_hide_back_done
	Global.dialog_system.play_sequence(Database.A_level_01_04)
	#await Global.dialog_system.sequence_finished
	#Global.dialog_system.play_sequence(Database.A_level_01_05)
	#await Global.dialog_system.sequence_finished
	#Global.dialog_system.play_sequence(Database.A_level_01_06)
	$"../search_phase/Room/Picture".release()
	
	await $"../search_phase/Room/Picture/Hitbox & Image".pressed
	await $"../TransitionWall".transition_show_up_done
	$"../search_phase/Room".lock()
	$"../search_phase/Letter".show()
	$"../dialog_system/TaskWindow".show()
	task_label.text = "[center]Folge den Anweisungen des Eichhörnchens."
	await $"../TransitionWall".transition_hide_back_done
	
	Global.dialog_system.play_sequence(Database.A_level_01_07)
	$"../search_phase/Room/DoorLeft".release()
	
	await $"../search_phase/Room/DoorLeft/Hitbox & Image".pressed
	await $"../TransitionWall".transition_show_up_done
	$"../search_phase/Room".lock()
	await $"../TransitionWall".transition_hide_back_done
	Global.dialog_system.play_sequence(Database.A_level_01_08)
	$"../search_phase/Room/DoorLeft".release()
	
	await $"../search_phase/Room/DoorLeft/Hitbox & Image".pressed
	await $"../TransitionWall".transition_show_up_done
	$"../search_phase/Room".lock()
	await $"../TransitionWall".transition_hide_back_done
	$"../search_phase/Room/DoorLeft".release()
	
	await $"../search_phase/Room/DoorLeft/Hitbox & Image".pressed
	await $"../TransitionWall".transition_show_up_done
	$"../search_phase/Room".lock()
	await $"../TransitionWall".transition_hide_back_done
	Global.dialog_system.play_sequence(Database.A_level_01_09)
	$"../search_phase/Room/DoorRight".release()
	
	await $"../search_phase/Room/DoorRight/Hitbox & Image".pressed
	await $"../TransitionWall".transition_show_up_done
	$"../search_phase/Room".lock()
	await $"../TransitionWall".transition_hide_back_done
	Global.dialog_system.play_sequence(Database.A_level_01_10)
	$"../search_phase/Room/Picture".release()
	
	await $"../search_phase/Room/Picture/Hitbox & Image".pressed
	
	
	
	
	
	load_level(level2)
	await $"../TransitionWall".transition_show_up_done
	task_label.text = "[center]Höre dem Eichhörnchen zu!"
	await $"../TransitionWall".transition_hide_back_done
	Global.dialog_system.play_sequence(Database.A_level_02_01)
	await Global.dialog_system.sequence_finished
	
	load_level(level2_2, true)
	task_label.text = "[center]Sortiere alle Zahlen in den Baum ein."
	Global.dialog_system.play_sequence(Database.A_level_02_02)
	await Global.dialog_system.sequence_finished
	
	while (!Global.current_level.inventory.is_empty() || !Helper.tree_is_sorted(Global.tree_root) || Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)):
		await get_tree().create_timer(0.1).timeout
	Global.dialog_system.play_sequence(Database.A_level_02_03)
	task_label.text = "[center]Klicke auf den Knopf\n\"Zur Suchphase\"."
	for child in Helper.get_all_children(Global.tree_root.get_parent()):
		if child is SnapTargetNode && child.snapTarget.snapperObject != null:
			child.snapTarget.snapperObject.lock()
	
	await $"../build_phase/DoneButton".pressed
	await $"../TransitionWall".transition_show_up_done
	$"../search_phase/Room/DoorRight/DoorNumber".hide()
	$"../search_phase/Room/DoorLeft/DoorNumber".hide()
	task_label.text = "[center]Finde die 42. Falls du dich verirrst, klicke auf die Zahl in der Mitte."
	await $"../TransitionWall".transition_hide_back_done
	Global.dialog_system.play_sequence(Database.A_level_02_04)
	
	# wait until player enters the destination room
	var picture: Picture = $"../search_phase/Room/Picture"
	while(!(int(picture.get_number()) == Global.destination_room.get_number())):
		await get_tree().create_timer(0.1).timeout
	Global.dialog_system.set_task("[center]Klicke auf die 42, um ins nächste Level zu kommen.")
	await $"../TransitionWall".transition_hide_back_done
	Global.dialog_system.play(Database.special_interaction_positive_02)
	
	await SignalBus.picture_right_room
	
	
	
	
	
	load_level(level3)
	await $"../TransitionWall".transition_show_up_done
	task_label.text = "[center]Höre dem Eichhörnchen zu!"
	await $"../TransitionWall".transition_hide_back_done
	Global.dialog_system.play_sequence(Database.A_level_03_1_01)
	
	await Global.dialog_system.sequence_finished
	$"../build_phase/InputLock".show()
	
	await get_tree().create_timer(3.0).timeout
	$"../build_phase/InputLock".hide()
	load_level(level3_2, true)
	task_label.text = "[center]Sortiere alle Zahlen in den Baum ein."
	Global.dialog_system.play_sequence(Database.A_level_03_2_01)
	
	# wait until inventory empty and tree is sorted
	# and play dialogue on correct insertion of 25 and 80
	while (!Global.current_level.inventory.is_empty() || !Helper.tree_is_sorted(Global.tree_root) || Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)):
		await get_tree().create_timer(0.1).timeout
		# if 25 was just inserted to the right SnapTargetNode
		if (room_number_just_inserted == 25 && Global.tree_root.get_left_child_node().get_left_child_node() != null && Global.tree_root.get_left_child_node().get_left_child_node().snapTarget.snapperObject.number == 25):
			Global.dialog_system.play_sequence(Database.A_level_03_2_02)
			Global.tree_root.get_left_child_node().get_left_child_node().snapTarget.snapperObject.lock()
			room_number_just_inserted = -1
		# if 80 was just inserted to the right SnapTargetNode
		if (room_number_just_inserted == 80 && Global.tree_root.get_right_child_node() != null && Global.tree_root.get_right_child_node().snapTarget.snapperObject.number == 80):
			Global.dialog_system.play_sequence(Database.A_level_03_2_03)
			Global.tree_root.get_right_child_node().snapTarget.snapperObject.lock()
			room_number_just_inserted = -1
	# lock entire tree
	for child in Helper.get_all_children(Global.tree_root.get_parent()):
		if child is SnapTargetNode && child.snapTarget.snapperObject != null:
			child.snapTarget.snapperObject.lock()
	Global.dialog_system.play_sequence(Database.A_level_03_2_04)
	task_label.text = "[center]Klicke auf den Knopf \"Zur Suchphase\", um deinen Baum zu durchlaufen."
	
	await $"../build_phase/DoneButton".pressed
	await $"../TransitionWall".transition_hide_back_done
	Global.dialog_system.play_sequence(Database.A_level_03_2_05)
	task_label.text = "[center]Finde die 95!"
	
	await SignalBus.picture_right_room
	
	
	
	
	
	load_level(level4)
	await $"../TransitionWall".transition_hide_back_done
	Global.dialog_system.play_sequence(Database.A_level_04_1_01)
	task_label.text = "[center]Führe eine Links-Rotation auf der 60 aus."
	
	while (!Helper.tree_is_balanced(Global.tree_root)):
		await get_tree().create_timer(0.1).timeout
	Global.dialog_system.play_sequence(Database.A_level_04_1_02)
	task_label.text = "[center]Navigiere zum Raum mit der Nummer 60."
	
	await SignalBus.picture_right_room
	
	
	
	
	
	load_level(level4_2)
	await $"../TransitionWall".transition_show_up_done
	task_label.text = "[center]Ziehe die 1 auf den Baum."
	await $"../TransitionWall".transition_hide_back_done
	Global.dialog_system.play_sequence(Database.A_level_04_2_01)
	
	# wait until player placed the 1 and lock the room afterwards
	while (!Global.current_level.inventory.is_empty() || Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)):
		await get_tree().create_timer(0.1).timeout
	Global.dialog_system.play_sequence(Database.A_level_04_2_02)
	Global.tree_root.get_left_child_node().get_left_child_node().get_left_child_node().get_left_child_node().snapTarget.snapperObject.lock()
	task_label.text = "[center]Rotiere die 30 so, dass der Baum balanciert wird."
	
	while (!Helper.tree_is_balanced(Global.tree_root)):
		await get_tree().create_timer(0.1).timeout
	Global.dialog_system.play_sequence(Database.A_level_04_2_03)
	task_label.text = "[center]Gehe in die Suchphase, um deinen Baum zu durchlaufen."
	
	await $"../build_phase/DoneButton".pressed
	await $"../TransitionWall".transition_show_up_done
	task_label.text = "[center]Finde die 27!"
	await $"../TransitionWall".transition_hide_back_done
	Global.dialog_system.play_sequence(Database.A_level_04_2_04)
	
	await SignalBus.picture_right_room
	
	
	
	
	
	load_level(level5)
	await $"../TransitionWall".transition_show_up_done
	task_label.text = "[center]Höre dem Eichhörnchen zu!"
	await $"../TransitionWall".transition_hide_back_done
	Global.dialog_system.play_sequence(Database.A_level_05_1_01)
	task_label.text = "[center]Führe eine Rechts-Rotation auf der 6 aus."
	
	await Global.dialog_system.sequence_finished
	var voiceline_rotated_6_played = false
	var voiceline_rotated_4_played = false
	while (!Helper.tree_is_balanced(Global.tree_root)):
		await get_tree().create_timer(0.1).timeout
		# Play Voiceline if the tree is in the state where a right rotation on the 6 was done
		if (voiceline_rotated_6_played == false &&
			Global.tree_root.get_left_child_node().get_number() == 8 &&
			Global.tree_root.get_left_child_node().get_left_child_node().get_number() == 4 &&
			Global.tree_root.get_left_child_node().get_left_child_node().get_right_child_node().get_number() == 5 &&
			Global.tree_root.get_left_child_node().get_left_child_node().get_right_child_node().get_right_child_node().get_number() == 6):
			Global.dialog_system.play_sequence(Database.A_level_05_1_02)
			task_label.text = "[center]Balanciere den Baum mit einer Links-Rotation."
			voiceline_rotated_6_played = true
		# Play Voiceline if the tree is in the state where a left rotation on the 4 after a right rotation on the 6 was done
		if (voiceline_rotated_4_played == false &&
			Global.tree_root.get_left_child_node().get_number() == 8 &&
			Global.tree_root.get_left_child_node().get_left_child_node().get_number() == 5 &&
			Global.tree_root.get_left_child_node().get_left_child_node().get_left_child_node().get_number() == 4 &&
			Global.tree_root.get_left_child_node().get_left_child_node().get_right_child_node().get_number() == 6):
			Global.dialog_system.play(Database.special_interaction_positive_01)
			task_label.text = "[center]Klicke auf \"Zur Suchphase\", um dein Ergebnis zu überprüfen!"
			voiceline_rotated_4_played = true
	
	await $"../build_phase/DoneButton".pressed
	await $"../TransitionWall".transition_show_up_done
	task_label.text = "[center]Finde den Weg zu Raum 6."
	await $"../TransitionWall".transition_hide_back_done
	Global.dialog_system.play_sequence(Database.A_level_05_1_03)
	
	await SignalBus.picture_right_room
	
	
	
	
	
	load_level(level5_2)
	await $"../TransitionWall".transition_show_up_done
	task_label.text = "[center]Höre dem Eichhörnchen zu!"
	await $"../TransitionWall".transition_hide_back_done
	Global.dialog_system.play_sequence(Database.A_level_05_2_01)
	
	await Global.dialog_system.sequence_finished
	load_level(level5_3, true)
	task_label.text = "[center]Balanciere den Baum durch Rotieren und gehe in die Suchphase."
	Global.dialog_system.play_sequence(Database.A_level_05_3_01)
	
	await $"../build_phase/DoneButton".pressed
	await $"../TransitionWall".transition_show_up_done
	task_label.text = "[center]Das Eichhörnchen ist weg... naja, du findest den Weg sicher alleine."
	
	await SignalBus.picture_right_room
	Global.dialog_system.play_sequence(Database.A_level_05_3_02)
	
	#TODO: Dann kommt der Credits-Bildschirm und der letzte Dialog




func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("ui_focus_next")):
		SignalBus.level_finished.emit()



func load_level(level: Node2D, skip_animation: bool = false):
	get_parent().switch_to_build_phase(skip_animation)
	for child in build_phase.get_children():
		if child is Level:
			child.queue_free()
	
	Global.destination_room = null
	build_phase.add_child(level)
	build_phase.move_child(level, 0)


func _on_roomMiniature_released_on_snapTarget(roomMiniature: RoomMiniature, snapTarget: SnapTarget):
	room_number_just_inserted = roomMiniature.number
