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

@export var bodies: Array[DynamicSpriteFrames] = []
@export var shirts: Array[DynamicSpriteFrames] = []

func build_sprites(body: Body, shirt: Shirt) -> Array[AnimatedSprite2D]:
	var sprites: Array[AnimatedSprite2D] = []
	
	push_sprite(sprites, bodies, body)
	push_sprite(sprites, shirts, shirt)
	
	return sprites

func push_sprite(sprites: Array[AnimatedSprite2D], frames: Array[DynamicSpriteFrames], index: int):
	if index >= len(frames):
		return
	
	var sprite = AnimatedSprite2D.new()
	var sprite_frames = frames[index].build_sprite_frames()
	sprite.sprite_frames = sprite_frames
	sprites.append(sprite)
