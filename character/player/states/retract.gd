class_name RetractStatePlayer
extends State

@export var player: Player

func enter() -> void:
	player.play_animation(Adult.Animations.ROD_CATCH)
	_retract_bobber()

func _retract_bobber() -> void:
	var bobber: Bobber = get_tree().get_first_node_in_group("bobber")
	if not bobber is Bobber:
		return
	
	bobber.queue_free()
	bobber.get_parent().remove_child(bobber)

func update(_delta: float) -> void:
	if player.style.get_current_frame() >= Config.ROD_CATCH_ANIMATION_END_FRAME_INDEX:
		transition_state.emit(self, "idle")
		return
