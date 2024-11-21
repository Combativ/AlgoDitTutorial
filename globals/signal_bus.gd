# The signal bus manages all signals that need to be global and/or scene-independent

extends Node

# This signal is emitted when a RoomMiniature object is released on a SnapTarget
# after a Drag and Drop action
signal room_miniature_released_on_snap_target(room_miniature, snapTarget)

# This signal is emitted as soon as a RoomMiniature is being dragged
signal room_miniature_dragged(room_miniature)

# This signal is emitted when a snapTarget is being told to release their RoomMiniature Object
signal snapTarget_kick_snapper(snapTarget)

# This signal is emitted when a RoomMiniature object was freed without dragging it
# (i.e. when dragging a RoomMiniature that has more RoomMiniature below it)
# This is in the inventory script to collect freed RoomMiniatures
signal room_miniature_freed(room_miniature)

##This signal is emitted when clicked on the picture of Global.destination_room (in search phase)
signal picture_right_room()

##This signal is emitted when clicked on a picture in another room than Global.destination_room (in search phase)
signal picture_wrong_room()
