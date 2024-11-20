# This script is a Singleton and contains variables that need to be accessed globally.

extends Node

# This variable references the root of the tree of the build phase.
# It is updated with every new level
var tree_root: SnapTargetNode = null:
	set(node):
		tree_root = node
	get():
		return tree_root

##stores the References of the SnapTargetNodes of the rooms the Player through in the search phase
##resets every time the search phase is entered 
var path_tracker: Array[SnapTargetNode] = []

##stores the Reference of the room that is the destination in the search phase
var destination_room: SnapTargetNode = null
