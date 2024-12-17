extends Node2D
class_name Door

##represents the room behind this door
@onready var door_node: SnapTargetNode 
##a label with the door´s number
@onready var door_number: Label = $"DoorNumber/PictureNumber"
##stores a reference to the TextureButton used for the door´s hitbox and texture
@onready var door_hitbox: TextureButton = $"Hitbox & Image"
##stores a reference to this door's AudioStreamPlayer2D
@onready var audioplayer: AudioPlayer = $AudioPlayer
#$AudioPlayer
#$"../../../dialog_system/Special_effects_player"
##sound that is played when moving through the door
@export var sound: AudioStream
@export var muted: bool


####################################################################################################
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_initialize()
	pass # Replace with function body.

##sets all textures of this Object to the ones stored in the Controller-class
func _initialize() -> void:
	set_img($"../../Controller".DOOR_IMG_NORMAL)
	set_img_hover($"../../Controller".DOOR_IMG_HOVER)
	set_img_doorplate($"../../Controller".DOOR_IMG_DOORPLATE)
	$"DoorNumber/Hitbox & Image".disabled = true
	self.audioplayer.stream = self.sound
	#self.get_door_hitbox().pressed.connect(self.audioplayer.play)

func _process(delta: float) -> void:
	if(muted and self.get_door_hitbox().pressed.is_connected(self.audioplayer.play)):
		self.get_door_hitbox().pressed.disconnect(self.audioplayer.play)
	elif(!muted and !self.get_door_hitbox().pressed.is_connected(self.audioplayer.play)):
		self.get_door_hitbox().pressed.connect(self.audioplayer.play)
	
#getter and setter
####################################################################################################

##returns the door´s number as an integer
func get_number() -> int:
	return int(door_number.get_text())
	
##returns the reference to the room behind this door
func get_door_node() -> SnapTargetNode:
	return self.door_node
	
##returns the entire label of the door to give access to more detailed instructions for the door´s number field
func get_door_label() -> Label:
	return self.door_number

##returns the hitbox of the door
func get_door_hitbox() -> TextureButton:
	return self.door_hitbox

##returns this door's AudioStreamPlayer2D
func get_audio_player() -> AudioPlayer:
	return self.audioplayer

##sets the door number to the new integer
func set_number(number: int):
	door_number.set_text(str(number))
	
##sets the door´s reference to the room behind it to the new one
##updates the door´s number
func set_door_node(node: SnapTargetNode) -> void:
	self.door_node = node
	update()
	
##sets the door´s texture to the new texture2D
##take care of the format of the new texture (1008 px)
func set_img(img: Texture2D) -> void:
	door_hitbox.set_texture_normal(img)
	
##sets the door´s texture - if the mouse hovers about the door - to the new texture2D
##take care, that the format is the same as for the normal texture (1008 px) 
func set_img_hover(img: Texture2D) -> void:
	door_hitbox.set_texture_hover(img)
	
##sets the doorplate´s texture to the new texture2D
func set_img_doorplate(img: Texture2D) -> void:
	$"DoorNumber/Hitbox & Image".set_texture_normal(img)

##sets this door's audio player to the transferred one
func set_audio_player(new_player: AudioPlayer) -> void:
	self.audioplayer = new_player
	
#methods
####################################################################################################	

##updates the door´s number to the number of the room, this door references to
func update() -> void:
	if self.door_node != null:
		set_number(self.door_node.get_number())
		door_hitbox.set_disabled(false)
		$Planks.hide()
	else:
		door_number.text = ""
		door_hitbox.set_disabled(true)
		$Planks.show()
	
##uses the method "move_to_room" from the Room class and hands over it´s own door_node
func move_trough_door() -> void:
	$"../".move_to_room(self.door_node)
	
##blocks every button of this object
## disabled = true
func lock() -> void:
	self.get_door_hitbox().disabled = true

##releases the buttons (buttons can be used again)
## disabled = false
func release() -> void:
	self.get_door_hitbox().disabled = false

##mutes the door's sound
func mute() -> void:
	self.muted = true

##unmutes the door's sound
func unmute() -> void:
	self.muted = false

##returns true if the audio player is muted, false otherwise
func is_muted() -> bool:
	return self.muted
