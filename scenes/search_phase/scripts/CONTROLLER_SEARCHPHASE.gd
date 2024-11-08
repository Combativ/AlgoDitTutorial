extends Node
class_name Controller

#Picture
@export var PICTURE_IMG: Texture2D = preload("res://scenes/search_phase/art/Picture_v01.png"):
	set(img):
		PICTURE_IMG = img
	get():
		return PICTURE_IMG

#Door
@export var DOOR_IMG_NORMAL: Texture2D =  preload("res://scenes/search_phase/art/Door_v06.png"):
	set(img):
		DOOR_IMG_NORMAL = img
	get():
		return DOOR_IMG_NORMAL
@export var DOOR_IMG_HOVER: Texture2D = preload("res://scenes/search_phase/art/Door_v03.png"):
	set(img):
		DOOR_IMG_HOVER = img
	get():
		return DOOR_IMG_HOVER
@export var DOOR_IMG_DOORPLATE: Texture2D = PICTURE_IMG