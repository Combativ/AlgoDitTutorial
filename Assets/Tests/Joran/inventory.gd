# This script handles moving freed Snappers back to the inventory

extends Node2D

func _ready() -> void:
	SignalBus.snapper_freed.connect(_on_snapper_freed)
	
	# move all Snappers into the inventory at the start
	for snapper in $"../SnapperContainer".get_children():
		_on_snapper_freed(snapper)


# This method is called, when a Snapper was kicked from the tree
# (i.e. by removing a Snapper that hat Snappers below it)
# This method loops through all SnapTarget children and puts the freed Snapper in any
# unoccupied Slot
func _on_snapper_freed(snapper) -> void:
	for child in Helper.get_all_children(self):
		if (child.name == "snap_target_script"):
			if (child.occupied == false):
				child.accept_snapper(snapper)
				break
