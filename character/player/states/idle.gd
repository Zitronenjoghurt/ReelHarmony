class_name IdleStatePlayer
extends State

@export var player: Player

func enter() -> void:
	player.velocity = Vector2.ZERO

func update(_delta: float) -> void:
	player.play_animation(player.Animations.IDLE)
	
	if Utils.is_direction_key_pressed():
		transition_state.emit(self, "move")
		return
	
	if Input.is_action_pressed("Throw_Rod"):
		transition_state.emit(self, "throwcharge")
		return
