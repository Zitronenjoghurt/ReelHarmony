class_name Adult
extends Character

enum Animations {
	IDLE,
	WALK,
	RUN,
	JUMP,
	ROD_CATCH,
	ROD_PULL,
	ROD_REEL,
	ROD_THROW
}

func play_animation(animation: Animations) -> void:
	style.play_animation(get_animation(animation, current_facing_direction))

func get_animation(animation: Animations, facing_direction: FacingDirection) -> String:
	return get_animation_name(animation) + "_" + Utils.get_facing_direction_name(facing_direction)

func get_animation_name(animation: Animations) -> String:
	match animation:
		Animations.IDLE:
			return "idle"
		Animations.WALK:
			return "walk"
		Animations.RUN:
			return "run"
		Animations.JUMP:
			return "jump"
		Animations.ROD_CATCH:
			return "rod_catch"
		Animations.ROD_PULL:
			return "rod_pull"
		Animations.ROD_REEL:
			return "rod_reel"
	return "rod_throw"
