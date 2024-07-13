class_name DynamicSpriteFrames
extends Resource

@export var cell_size: Vector2 = Vector2(64, 64)
@export var animations: Array[DynamicSpriteFramesAnimation] = []

func build_sprite_frames() -> SpriteFrames:
	var sprite_frames = SpriteFrames.new()
	
	for animation in animations:
		build_animation_frames(sprite_frames, animation)
	
	return sprite_frames

func build_animation_frames(sprite_frames: SpriteFrames, animation: DynamicSpriteFramesAnimation):
	for direction in range(4):
		var animation_name = animation.name + "_" + Utils.get_facing_direction_name(direction)
		sprite_frames.add_animation(animation_name)
		sprite_frames.set_animation_loop(animation_name, animation.loops)
		sprite_frames.set_animation_speed(animation_name, animation.fps)
		
		for frame_index in range(animation.frame_count):
			var coords = Vector2(frame_index, direction)
			var texture = create_atlas_texture(coords, animation.sheet)
			sprite_frames.add_frame(animation_name, texture)

func create_atlas_texture(coords: Vector2, texture: CompressedTexture2D) -> AtlasTexture:
	var atlas_texture = AtlasTexture.new()
	atlas_texture.atlas = texture
	atlas_texture.region = Rect2(coords * cell_size, cell_size)
	return atlas_texture
