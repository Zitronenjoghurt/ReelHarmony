class_name AdultStyle
extends Resource

enum Body {
	LIGHT
}

@export var bodies: Array[SpriteFrames] = []

func build_sprites(body: Body) -> Array[AnimatedSprite2D]:
	var body_sprite = AnimatedSprite2D.new()
	body_sprite.sprite_frames = bodies[body]
	
	return [body_sprite]
