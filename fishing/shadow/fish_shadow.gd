class_name FishShadow
extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = %Sprite
@onready var collision: CollisionShape2D = %Collision
@onready var touch_area: Area2D = %TouchArea
@onready var touch_collision: CollisionShape2D = %TouchCollision
@export var fish_data: FishData

enum Animations {
	APPEAR,
	DISAPPEAR,
	SWIM
}

const capsule_collision_radii: Array[int] = [1, 2, 4]
const capsule_collision_heights: Array[int] = [6, 8, 14]
const touch_collision_radii: Array[int] = []

var current_direction: Orientation.Direction8 = Orientation.Direction8.E
var touch_bobber_deter: bool = false

func _ready() -> void:
	if not fish_data is FishData:
		kill()
	
	# Apply fish data size
	scale = Vector2.ONE * fish_data.size_multiplier
	
	_init_body_collision_shapes()
	_update_facing_direction()
	_update_collision_rotation()
	
func _init_body_collision_shapes() -> void:
	var shape: CapsuleShape2D = CapsuleShape2D.new()
	shape.radius = capsule_collision_radii[fish_data.size_category]
	shape.height = capsule_collision_heights[fish_data.size_category]
	collision.shape = shape
	touch_collision.shape = shape

func _physics_process(_delta: float) -> void:
	if velocity != Vector2.ZERO:
		_update_facing_direction()
		_update_collision_rotation()
	move_and_slide()

func _update_facing_direction() -> void:
	current_direction = Orientation.direction8_from_vec(velocity)
	
func _update_collision_rotation() -> void:
	var rotation_deg: int = Orientation.get_direction8_rotation_deg(current_direction)
	collision.rotation_degrees = rotation_deg + 90
	touch_collision.rotation_degrees = rotation_deg + 90

func kill() -> void:
	queue_free()
	get_parent().remove_child(self)

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

func _on_touch_area_area_entered(area: Area2D) -> void:
	if area is BobberDeterArea:
		touch_bobber_deter = true

func _on_touch_area_area_exited(area: Area2D) -> void:
	if area is BobberDeterArea:
		touch_bobber_deter = false
