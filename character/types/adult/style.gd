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

@export var bodies: Array[SpriteFrames] = []
@export var shirts: Array[SpriteFrames] = []

func build_sprites(body: Body, shirt: Shirt) -> Array[AnimatedSprite2D]:
	var sprites: Array[AnimatedSprite2D] = []
	
	if body < len(bodies):
		var body_sprite = AnimatedSprite2D.new()
		body_sprite.sprite_frames = bodies[body]
		sprites.append(body_sprite)
	
	if shirt < len(shirts):
		var shirt_sprite = AnimatedSprite2D.new()
		shirt_sprite.sprite_frames = shirts[shirt]
		sprites.append(shirt_sprite)
	
	return sprites
