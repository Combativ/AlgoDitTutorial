extends Node2D
class_name Room

@onready var room_node: SnapTargetNode
@onready var door_left: Door = $"DoorLeft"
@onready var door_right: Door = $"DoorRight"
@onready var picture: Node2D = $"Picture"
@onready var sound_options_window: SoundOptionsWindow = $"../../sound_options_window"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.picture_wrong_room.connect(func(): self.move_to_room(Global.tree_root))
	
	#wait until neccessary code is loaded
	await get_tree().create_timer(0.5).timeout
	
	SignalBus.sound_mute_status_update.connect(func():
		if(sound_options_window.get_mute_status_sfx()):
			self.door_left.get_audio_player().volume_db = -80
			self.door_right.get_audio_player().volume_db = -80
		else:
			self.door_left.get_audio_player().volume_db = Global.sound_options_window.get_sound_control().get_special_effects_volume_db()
			self.door_right.get_audio_player().volume_db = Global.sound_options_window.get_sound_control().get_special_effects_volume_db()
	)
	pass 

##initializes the first room with Global.tree_root as room_node (first node to enter)
func _initialize() -> void:
	move_to_room(Global.tree_root)
	
#methods
####################################################################################################

##sets the door´s node to the new one and
##updates the room´s links and numbers to the new ones
##adds the room, to move in, to Global.path_tracker
func move_to_room(node: SnapTargetNode) -> void:
	self.room_node = node
	Global.path_tracker.append(self.room_node)
	$"../".transition($"..".transition_time)
	await $"../../TransitionWall".transition_show_up_done
	update()

##updates the room´s links and numbers to the ones of the room_node´s
##enables button of the piture if in the destination_room
func update() -> void:
	if door_left != null:
		door_left.set_door_node(self.room_node.get_left_child_node())
		door_left.update()
	if door_right != null:
		door_right.set_door_node(self.room_node.get_right_child_node())
		door_right.update()
	picture.set_number(self.room_node.get_number())
	pass

##blocks every button of this object
## disabled = true
func lock() -> void:
	door_left.lock()
	door_right.lock()
	picture.lock()
	
##releases the buttons (buttons can be used again)
## disabled = false
func release() -> void:
	door_left.release()
	door_right.release()
	picture.release()

##mutes every sound of the room and it´s objects
func mute() -> void:
	door_left.mute()
	door_right.mute()

##unmutes every sound of the room and it´s objects
func unmute() -> void:
	door_left.unmute()
	door_right.unmute()

##returns true if the entire room is muted, false otherwise
func is_muted() -> bool:
	return door_left.is_muted() and door_right.is_muted()
