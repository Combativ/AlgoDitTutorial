# This script is a Singleton and contains variables that need to be accessed globally.

extends Node

# This variable references the root of the tree of the build phase.
# It is updated with every new level
var tree_root: SnapTargetNode = null:
	set(node):
		tree_root = node
	get():
		return tree_root

var path_tracker: Array = []
