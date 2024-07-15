class_name AdultStyle
extends Resource

enum Body {
	LIGHT,
	NONE
}

enum Shirt {
	DARK_BLUE,
	LIGHT_BLUE,
	NONE
}

enum HairStyle {
	BIG_BUN,
	NONE
}

enum HairColor {
	WHITE,
	ORANGE,
	PURPLE,
	PINK,
	GREEN,
	LIGHT_BROWN,
	DARK_BROWN,
	BLUE,
	YELLOW,
	BLACK,
	NONE
}

@export var bodies: Array[DynamicSpriteFrames] = []
@export var shirts: Array[DynamicSpriteFrames] = []
@export var hairstyles: Array[DynamicHairStyle] = []

func build_sprites(body: Body, shirt: Shirt, hair_style: HairStyle, hair_color: HairColor) -> Array[AnimatedSprite2D]:
	var sprites: Array[AnimatedSprite2D] = []
	
	push_sprite(sprites, 0, bodies, body)
	push_sprite(sprites, 0, shirts, shirt)
	push_hair_sprite(sprites, hairstyles, hair_style, hair_color)
	
	return sprites

func push_sprite(sprites: Array[AnimatedSprite2D], z_index: int, frames: Array[DynamicSpriteFrames], index: int) -> void:
	if index >= len(frames):
		return
	
	var sprite: AnimatedSprite2D = AnimatedSprite2D.new()
	sprite.z_index = z_index
	var sprite_frames: SpriteFrames = SpriteFrames.new() 
	frames[index].build_sprite_frames(sprite_frames)
	sprite.sprite_frames = sprite_frames
	sprites.append(sprite)

func push_hair_sprite(sprites: Array[AnimatedSprite2D], frames: Array[DynamicHairStyle], style_index: int, color_index: int) -> void:
	if style_index >= len(frames):
		return
	
	var sprite: AnimatedSprite2D = AnimatedSprite2D.new()
	sprite.z_index = 1
	var sprite_frames: SpriteFrames = SpriteFrames.new() 
	frames[style_index].build_sprite_frames_by_color(sprite_frames, color_index)
	sprite.sprite_frames = sprite_frames
	sprites.append(sprite)
