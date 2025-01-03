# This script is a Singleton and contains variables that need to be accessed globally.

extends Node

# This variable references the root of the tree of the build phase.
# It is updated with every new level
var tree_root: SnapTargetNode = null

# This variable references the level and is updated when a new level
# is loaded
var current_level: Level = null

##stores the references of the SnapTargetNodes of the rooms the Player through in the search phase
##resets every time the search phase is entered 
var path_tracker: Array[SnapTargetNode] = []

##stores the reference of the room that is the destination in the search phase
var destination_room: SnapTargetNode = null

##stores the reference to the in game dialog system
var dialog_system: Dialogsystem = null

##stores the reference to the search phase
var search_phase: SearchPhase = null

##stores the reference to the build phase
var build_phase: BuildPhase = null

##stores the reference to the sound options window
var sound_options_window: SoundOptionsWindow = null
