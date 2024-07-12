class_name CharacterStyle
extends Node2D

func build(config: CharacterStyleConfig):
	var sprites: Array[AnimatedSprite2D] = config.build_sprites()
	for sprite in sprites:
		add_child(sprite)
