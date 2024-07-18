extends Node

# How long the fishing rod throw needs to charge to reach its peak
@export var MAX_ROD_THROW_TIME_SEC: float = 1.5

# The index of the frame when the rod throw animation will pause 
# so it stops when the player is charging the throw
@export var ROD_THROW_ANIMATION_STOP_FRAME_INDEX: int = 1

@export var ROD_THROW_ANIMATION_END_FRAME_INDEX: int = 6
@export var ROD_CATCH_ANIMATION_END_FRAME_INDEX: int = 4
@export var FISH_APPEAR_END_FRAME_INDEX: int = 3
