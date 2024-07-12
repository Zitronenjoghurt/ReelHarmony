class_name IdleStatePlayer
extends State

@onready var adult: Adult = get_parent().get_parent()

func update(delta: float):
	adult.play_animation(adult.Animations.IDLE)
	
	if Utils.is_direction_key_pressed():
		transition_state.emit(self, "move")
