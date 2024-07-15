class_name FishingRod
extends AnimatedSprite2D

enum RodColor {
	BLACK_RED
}

enum Animations {
	CATCH,
	REEL,
	THROW,
	PULL
}

const rod_sprite_frame_paths: Dictionary = {
	RodColor.BLACK_RED: "res://resources/fishing_rods/black_red.tres"
}

@export var current_color: RodColor = RodColor.BLACK_RED

func _ready() -> void:
	_build_sprites()
	
func _build_sprites() -> void:
	var frames: SpriteFrames = SpriteFrames.new()
	
	for color: RodColor in rod_sprite_frame_paths.keys():
		var path: String = rod_sprite_frame_paths[color]
		var dynamic_frames: DynamicSpriteFrames = load(path)
		dynamic_frames.build_sprite_frames(frames, str(color))
	
	sprite_frames = frames

func play_animation(rod_animation: Animations, direction: Character.FacingDirection) -> void:
	var animation_name: String = get_animation_name(rod_animation) + "_" + Utils.get_facing_direction_name(direction) + str(current_color)
	if sprite_frames.has_animation(animation_name):
		play(animation_name)
	
func get_animation_name(rod_animation: Animations) -> String:
	match rod_animation:
		Animations.CATCH:
			return "catch"
		Animations.REEL:
			return "reel"
		Animations.THROW:
			return "throw"
	return "pull"
