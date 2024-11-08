extends Node2D
class_name Door

@onready var door_node: SnapTargetNode = null:
	set(node):
		set_door_node(node)
	get():
		return get_door_node()
@onready var door_number: Label = $"DoorNumber/PictureNumber"
@onready var door_hitbox: TextureButton = $"Hitbox & Image"

####################################################################################################
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_initialize()
	pass # Replace with function body.

#sets all textures
func _initialize() -> void:
	set_img($"../../Controller".DOOR_IMG_NORMAL)
	set_img_hover($"../../Controller".DOOR_IMG_HOVER)
	set_img_doorplate($"../../Controller".DOOR_IMG_DOORPLATE)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

####################################################################################################

func set_number(number: int):
	door_number.set_text(str(number))
	
func get_number() -> int:
	return int(door_number.get_text())
	
func set_img(img: Texture2D) -> void:
	$"Hitbox & Image".set_texture_normal(img)
	
func set_img_hover(img: Texture2D) -> void:
	$"Hitbox & Image".set_texture_hover(img)
	
func set_img_doorplate(img: Texture2D) -> void:
	$"DoorNumber/Hitbox & Image".set_texture_normal(img)
	
func set_door_node(node: SnapTargetNode) -> void:
	door_node = node
	
func get_door_node() -> SnapTargetNode:
	return door_node
	
func update() -> void:
	set_number(self.door_node.get_number())
