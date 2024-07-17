class_name FishingStatePlayer
extends State

@export var player: Player

func update(_delta: float) -> void:
	if Input.is_action_pressed("Throw_Rod"):
		transition_state.emit(self, "retract")
		return
