class_name MoveStatePlayer
extends State

@export var player: Player

func update(_delta: float) -> void:
	var speed_multiplier: float = 1.0
	
	if Input.is_action_pressed("Run"):
		speed_multiplier = player.config.RUN_SPEED_MULTIPLIER
		player.play_animation(player.Animations.RUN)
	else:
		player.play_animation(player.Animations.WALK)
	
	var direction_h: int = Utils.get_input_direction_h()
	var direction_v: int = Utils.get_input_direction_v()
	player.move(direction_h, direction_v, speed_multiplier)
	
	if not Utils.is_direction_key_pressed():
		transition_state.emit(self, "idle")
		return
	
	if Input.is_action_pressed("Throw_Rod"):
		transition_state.emit(self, "rodthrow")
		return
