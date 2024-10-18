# The signal bus manages all signals that need to be global and/or scene-independent

extends Node

# This signal is emitted when a snapper object is released on a SnapTarget after a Drag and Drop action
signal snapper_released_on_snapTarget(snapper, snapTarget)
# This signal is emitted as soon as a snapper is being dragged
signal snapper_dragged(snapper)
#This 
