# This script contains methods to make my life easier. This script must be an Autoload Singleton
# so these methods can be accessed anytime and anywhere.

extends Node


# disable and enable a node. Makes it invisible and deactivates all of it's functionalities
func disable_and_hide_node(node:Node) -> void:
	node.set_process_mode(Node.PROCESS_MODE_DISABLED)
	node.hide()

func enable_and_show_node(node:Node) -> void:
	node.set_process_mode(Node.PROCESS_MODE_INHERIT)
	node.show()


# get all children and sub-children of a given node, returned in an array
# I did not write this myself, but edited some parts. Source can be found at:
# https://forum.godotengine.org/t/how-to-get-all-children-from-a-node/18587/2
func get_all_children(node, arr:=[], depth:=0):
	if (depth != 0):
		arr.push_back(node)
	for child in node.get_children():
		arr = get_all_children(child, arr, depth+1)
	return arr
