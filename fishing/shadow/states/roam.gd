class_name RoamStateFish
extends State

@export var fish: FishShadow

func update(_delta: float) -> void:
	fish.play_animation(FishShadow.Animations.SWIM)
	
	if fish.touch_bobber_deter:
		transition_state.emit(self, "disappear")
		return
