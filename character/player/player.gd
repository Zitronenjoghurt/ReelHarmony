class_name Player
extends Adult

@export var bobber_scene: PackedScene

@onready var rod_throw_bar: RodThrowBar = %RodThrowBar
@onready var fishing_rod: FishingRod = %FishingRod
@onready var bobber_indicator: BobberIndicator = %BobberIndicator

var current_rod_throw_strength: float = 0.0

func play_animation(animation: Animations) -> void:
	super.play_animation(animation)
	
	match animation:
		Animations.ROD_THROW:
			play_fishing_rod_animation(FishingRod.Animations.THROW)
		Animations.ROD_CATCH:
			play_fishing_rod_animation(FishingRod.Animations.CATCH)
		Animations.ROD_PULL:
			play_fishing_rod_animation(FishingRod.Animations.PULL)
		Animations.ROD_REEL:
			play_fishing_rod_animation(FishingRod.Animations.REEL)
		_:
			fishing_rod.hide()
		
func play_fishing_rod_animation(animation: FishingRod.Animations) -> void:
	fishing_rod.show()
	fishing_rod.play_animation(animation, current_facing_direction)
