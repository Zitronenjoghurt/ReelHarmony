class_name CharacterStyle
extends Node2D

func build(config: CharacterStyleConfig) -> void:
	if not config is CharacterStyleConfig:
		return
	var sprites: Array[AnimatedSprite2D] = config.build_sprites()
	for sprite: AnimatedSprite2D in sprites:
		add_child(sprite)

func play_animation(animation_name: String) -> void:
	for child: AnimatedSprite2D in get_children():
		if child is AnimatedSprite2D and child.sprite_frames.has_animation(animation_name):
			child.play(animation_name)
