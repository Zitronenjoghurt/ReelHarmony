class_name RodThrowStatePlayer
extends State

@export var player: Player

func enter():
	player.velocity = Vector2.ZERO
	player.play_animation(player.Animations.ROD_THROW)

func update(delta: float):
	if not Input.is_action_pressed("Throw_Rod"):
		transition_state.emit(self, "idle")
