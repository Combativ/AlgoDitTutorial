extends Node

class_name BinaryTree

var data: RoomMiniature
var left: BinaryTree
var right: BinaryTree


func rotate_right(node: BinaryTree = self) -> BinaryTree:
	var new_root = node.left
	
	node.left = new_root.right
	new_root.right = node
	
	return new_root

func rotate_left(node: BinaryTree = self) -> BinaryTree:
	var new_root = node.right
	
	node.right = new_root.left
	new_root.left = node
	
	return new_root



func convert_to_binary_subtree() -> BinaryTree:
	# clear variables
	data = null
	right = null
	left = null
	
	data = get_parent().snapTarget.snapperObject
	if (get_parent().get_left_child_node() != null):
		left = get_parent().get_left_child_node().get_node("binary_tree_script").convert_to_binary_subtree()
	if (get_parent().get_right_child_node() != null):
		right = get_parent().get_right_child_node().get_node("binary_tree_script").convert_to_binary_subtree()
	
	return self


func _is_leaf() -> bool:
	if (left == null && right == null):
		return true
	else:
		return false
