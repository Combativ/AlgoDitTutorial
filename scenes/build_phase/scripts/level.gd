# This script is attached to the root node of every level
extends Node2D

# reference to the tree root of the level
@onready var tree_root_node = find_child("root")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Update the tree root reference
	Global.tree_root = tree_root_node
