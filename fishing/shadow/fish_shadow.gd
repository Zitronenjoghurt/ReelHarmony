class_name FishShadow
extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = %Sprite
@onready var collision: CollisionShape2D = %Collision
@export var fish_data: FishData

enum Animations {
	APPEAR,
	DISAPPEAR,
	SWIM
}

var current_direction: Orientation.Direction8 = Orientation.Direction8.E

func _ready() -> void:
	if not fish_data is FishData:
		queue_free()
		get_parent().remove_child(self)

func _physics_process(_delta: float) -> void:
	if velocity != Vector2.ZERO:
		_update_facing_direction()
		_update_facing_direction()
	move_and_slide()

func _update_facing_direction() -> void:
	current_direction = Orientation.direction8_from_vec(velocity)
	
func _update_collision_rotation() -> void:
	var rotation_deg: int = Orientation.get_direction8_rotation_deg(current_direction)
	collision.rotation_degrees = rotation_deg - 45

func play_animation(animation_to_play: Animations) -> void:
	var size: String = fish_data.get_size_category_name()
	var animation_name: String = get_animation_name(animation_to_play)
	
	var animation: String = ""
	if animation_to_play == Animations.SWIM:
		var direction: String = Orientation.get_direction8_name(current_direction)
		animation = size + "_" + animation_name + "_" + direction
	else:
		animation = size + "_" + animation_name
	
	sprite.play(animation)
	
func get_animation_name(animation: Animations) -> String:
	match animation:
		Animations.APPEAR:
			return "appear"
		Animations.DISAPPEAR:
			return "disappear"
	return "swim"
	
func get_current_direction_rotation() -> int:
	return current_direction * 45
