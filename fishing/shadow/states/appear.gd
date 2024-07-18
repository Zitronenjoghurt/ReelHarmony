class_name AppearStateFish
extends State

@export var fish: FishShadow

func update(_delta: float) -> void:
	fish.play_animation(FishShadow.Animations.APPEAR)
	if fish.sprite.frame >= Config.FISH_APPEAR_END_FRAME_INDEX:
		transition_state.emit(self, "roam")
