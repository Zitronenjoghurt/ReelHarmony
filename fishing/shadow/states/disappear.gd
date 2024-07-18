class_name DisappearStateFish
extends State

@export var fish: FishShadow

func update(_delta: float) -> void:
	fish.play_animation(FishShadow.Animations.DISAPPEAR)
	if fish.sprite.frame >= Config.FISH_DISAPPEAR_END_FRAME_INDEX:
		fish.kill()
