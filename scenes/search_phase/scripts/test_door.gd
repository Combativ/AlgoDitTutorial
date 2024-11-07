extends Node2D
class_name Door

@export var hitbox: TextureButton
@export var pos_x: int:
	set(new_pos_x):
		pos_x = new_pos_x
		self.position.x = new_pos_x
	get:
		return pos_x
@export var pos_y: int:
	set(new_pos_y):
		pos_y = new_pos_y
		self.position.y = new_pos_y
@export var door_number: int:
	set(new_door_number):
		door_number = new_door_number
	get:
		return door_number
@export var door_model_path: String:
	set(new_path):
		self.texture = load(new_path)
	get: 
		return door_model_path


func _ready() -> void:
	self.show()
	#hitbox = TextureButton.new()
	#hitbox.texture_normal = load("res://icon.svg")
	#hitbox.position.x = 100
	#hitbox.position.y = 100
	var vector : Vector2
	vector.x = 20
	vector.y = 100
	hitbox.set_position(vector,false)
	hitbox.show()
	add_child(hitbox)


func _init(position: Vector2, door_number: int, texture_path = "res://icon.svg") -> void:
	self.door_model_path = texture_path
	self.position.x = 100
	self.position.y = 100
	hitbox.texture_normal = load(door_model_path)
	
func _process(delta: float) -> void:
	pass
	
