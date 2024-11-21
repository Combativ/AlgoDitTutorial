# This script is attached to the root node of every level
extends Node2D

# reference to the tree root of the level
@onready var tree_root_node = find_child("root")
@onready var main = get_tree().get_root().get_node("Main")



# variables to enable/disable functions. These must be set
# in the inspector, for each level

  # lock all tree nodes that have been set in the editor, during design-time
  # The player can only move tree nodes he has placed himself
@export var lock_predefined_nodes_in_tree: bool = false

  # usually only part of the tree is shown and when you place a room, the
  # tree expands. With show_entire_tree all room "slots" are shown and you can
  # place rooms anywhere. This induces a check that all rooms are connected, before
  # moving to the search phase
#@export var show_entire_tree: bool = false

  # if sorted_insertion is true, nodes will always insert in their sorted position,
  # independent of where the player put it. If the sorted position can't be
  # reached (the maximum depth of the tree is reached), the Node will go back
  # to the inventory and send a signal
#@export var sorted_insertion: bool = false

  # enables the left and right rotation operations
#@export var enable_rotation_operations: bool = false

  # The level starts in search phase. This only works if the level has a
  # predefined tree
@export var start_in_search_phase: bool = false




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Update the tree root reference
	Global.tree_root = tree_root_node
	
	if (lock_predefined_nodes_in_tree == true):
		await main.ready
		for child in Helper.get_all_children(self):
			if (child is SnapTarget && child.snapperObject != null):
				child.snapperObject.get_node("DragMask").disabled = true
	
	if (start_in_search_phase == true):
		await main.ready
		main.switch_to_search_phase()
