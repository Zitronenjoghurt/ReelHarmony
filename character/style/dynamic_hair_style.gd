class_name DynamicHairStyle
extends DynamicSpriteFrames

func build_sprite_frames_by_color(sprite_frames: SpriteFrames, color_index: int = 0, name_suffix: String = "") -> SpriteFrames:	
	for animation: DynamicSpriteFramesAnimation in animations:
		build_animation_frames(sprite_frames, animation, name_suffix, color_index * 4)
	
	return sprite_frames
