class_name AdultStyleConfig
extends CharacterStyleConfig

const style_path: String = "res://resources/character/adult/style.tres"

@export var body: AdultStyle.Body = AdultStyle.Body.LIGHT
@export var shirt: AdultStyle.Shirt = AdultStyle.Shirt.NONE

var style: AdultStyle = load(style_path)

func build_sprites() -> Array[AnimatedSprite2D]:
	return style.build_sprites(body, shirt)
