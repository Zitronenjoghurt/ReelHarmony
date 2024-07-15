class_name DynamicSpriteFrames
extends Resource

@export var cell_size: Vector2 = Vector2(64, 64)
@export var animations: Array[DynamicSpriteFramesAnimation] = []

func build_sprite_frames(sprite_frames: SpriteFrames, name_suffix: String = "") -> SpriteFrames:	
	for animation: DynamicSpriteFramesAnimation in animations:
		build_animation_frames(sprite_frames, animation, name_suffix)
	
	return sprite_frames

func build_animation_frames(sprite_frames: SpriteFrames, animation: DynamicSpriteFramesAnimation, name_suffix: String) -> void:
	for direction: int in range(4):
		var animation_name: String = animation.name + "_" + Utils.get_facing_direction_name(direction) + name_suffix
		sprite_frames.add_animation(animation_name)
		sprite_frames.set_animation_loop(animation_name, animation.loops)
		sprite_frames.set_animation_speed(animation_name, animation.fps)
		
		for frame_index: int in range(animation.frame_count):
			var coords: Vector2 = Vector2(frame_index, direction)
			var texture: AtlasTexture = create_atlas_texture(coords, animation.sheet)
			sprite_frames.add_frame(animation_name, texture)

func create_atlas_texture(coords: Vector2, texture: CompressedTexture2D) -> AtlasTexture:
	var atlas_texture: AtlasTexture = AtlasTexture.new()
	atlas_texture.atlas = texture
	atlas_texture.region = Rect2(coords * cell_size, cell_size)
	return atlas_texture
