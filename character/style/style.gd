class_name CharacterStyle
extends Node2D

func build(config: CharacterStyleConfig):
	var sprites: Array[AnimatedSprite2D] = config.build_sprites()
	for sprite in sprites:
		add_child(sprite)

func play_animation(animation_name: String):
	for child in get_children():
		if child is AnimatedSprite2D and child.sprite_frames.has_animation(animation_name):
			child.play(animation_name)
