# This script is a Singleton and contains variables that need to be accessed globally.

extends Node

# This variable references the root of the tree of the build phase.
# It is updated with every new level
var tree_root = null
