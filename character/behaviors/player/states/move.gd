class_name MoveStatePlayer
extends State

@onready var adult: Adult = get_parent().get_parent()

func update(delta: float):
	var speed_multiplier: float = 1.0
	
	if Input.is_action_pressed("Run"):
		speed_multiplier = adult.config.RUN_SPEED_MULTIPLIER
		adult.play_animation(adult.Animations.RUN)
	else:
		adult.play_animation(adult.Animations.WALK)
	
	var direction_h = Utils.get_input_direction_h()
	var direction_v = Utils.get_input_direction_v()
	adult.move(direction_h, direction_v, speed_multiplier)
	
	if not Utils.is_direction_key_pressed():
		transition_state.emit(self, "idle")
