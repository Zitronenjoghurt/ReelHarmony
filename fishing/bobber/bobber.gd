class_name Bobber
extends Area2D

enum BobberColor {
	RED,
	GREEN,
	YELLOW
}

enum Animations {
	FLOAT,
	BITE
}

@export var bobber_color: BobberColor = BobberColor.RED
@onready var sprite: AnimatedSprite2D = %Sprite

func _ready() -> void:
	add_to_group("bobber")
	play_animation(Animations.FLOAT)

func play_animation(animation: Animations) -> void:
	var animation_name: String = get_animation_name(animation) + "_" + get_color_name(bobber_color)
	sprite.play(animation_name)

func get_color_name(color: BobberColor) -> String:
	match color:
		BobberColor.GREEN:
			return "green"
		BobberColor.YELLOW:
			return "yellow"
	return "red"

func get_animation_name(animation: Animations) -> String:
	if animation == Animations.FLOAT:
		return "float"
	return "bite"
