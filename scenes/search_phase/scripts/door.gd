extends Node2D
class_name Door

##represents the room behind this door
@onready var door_node: SnapTargetNode = Global.tree_root
##a label with the door´s number
@onready var door_number: Label = $"DoorNumber/PictureNumber"
##stores a reference to the TextureButton used for the door´s hitbox and texture
@onready var door_hitbox: TextureButton = $"Hitbox & Image"



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

#TODO creating Null Door 
#func _init() -> void:
	#door_node = null
	#door_number.text = ""
	#door_hitbox.pressed.disconnect(door_hitbox.get_connections()[0])
	#return Door.new()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

####################################################################################################

##sets the door number to the new integer
func set_number(number: int):
	door_number.set_text(str(number))
	
##returns the door´s number as an integer
func get_number() -> int:
	return int(door_number.get_text())
	
##sets the door´s texture to the new texture2D
##take care of the format of the new texture (1008 px)
func set_img(img: Texture2D) -> void:
	$"Hitbox & Image".set_texture_normal(img)
	
##sets the door´s texture - if the mouse hovers about the door - to the new texture2D
##take care, that the format is the same as for the normal texture (1008 px) 
func set_img_hover(img: Texture2D) -> void:
	$"Hitbox & Image".set_texture_hover(img)
	
##sets the doorplate´s texture to the new texture2D
func set_img_doorplate(img: Texture2D) -> void:
	$"DoorNumber/Hitbox & Image".set_texture_normal(img)
	
##sets the door´s reference to the room behind it to the new one
##updates the door´s number
func set_door_node(node: SnapTargetNode) -> void:
	self.door_node = node
	update()

##returns the reference to the room behind this door
func get_door_node() -> SnapTargetNode:
	return self.door_node

##returns the entire label of the door to give access to more detailed instructions for the door´s number field
func get_door_label() -> Label:
	return self.door_number

func get_door_hitbox() -> TextureButton:
	return self.door_hitbox
	
#TODO something wents wrong (get_number() does not exist? but it actually does)
##updates the door´s number to the number of the room, this door references to
func update() -> void:
	if self.door_node != null:
		set_number(self.door_node.get_number())
		door_hitbox.set_disabled(false)
	else:
		door_number.text = ""
		door_hitbox.set_disabled(true)
	
##uses the method "move_to_room" from the Room class and hands over it´s own door_node
func move_trough_door() -> void:
	$"../".move_to_room(self.door_node)
	$"../../".move_counter_increment()
