# The signal bus manages all signals that need to be global and/or scene-independent

extends Node

# This signal is emitted when a snapper object is released on a SnapTarget after a Drag and Drop action
signal snapper_released_on_snapTarget(snapper, snapTarget)

# This signal is emitted as soon as a snapper is being dragged
signal snapper_dragged(snapper)

# This signal is emitted when a snapTarget is being told to release their Snapper Object
signal snapTarget_kick_snapper(snapTarget)

# This signal is emitted when a Snapper object was freed without explicitly dragging it
# (i.e. when dragging a Snapper that has more Snappers below it)
# This is used to signal to the Snappers to move back to the inventory
signal snapper_freed(snapper)
