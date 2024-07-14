class_name IdleStatePlayer
extends State

@export var player: Player

func enter():
	player.velocity = Vector2.ZERO

func update(delta: float):
	player.play_animation(player.Animations.IDLE)
	
	if Utils.is_direction_key_pressed():
		transition_state.emit(self, "move")
		return
	
	if Input.is_action_pressed("Throw_Rod"):
		transition_state.emit(self, "rodthrow")
		return
