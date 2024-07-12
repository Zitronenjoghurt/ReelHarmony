class_name Character
extends CharacterBody2D

@export var config: CharacterConfig
@export var style_config: CharacterStyleConfig

@onready var style: CharacterStyle = %Style

enum FacingDirection {
	LEFT,
	RIGHT,
	UP,
	DOWN
}

var current_facing_direction: FacingDirection = FacingDirection.DOWN

func _ready():
	_load_style()
	
func _physics_process(delta):
	move_and_slide()
	
func _load_style():
	if not style_config is CharacterStyleConfig:
		return
	style.build(style_config)

func move(direction_h: int, direction_v: int, speed_multiplier: float = 1.0):
	if direction_h != 0 and direction_v != 0:
		velocity.x = (direction_h * config.SPEED * speed_multiplier) / sqrt(2)
		velocity.y = (direction_v * config.SPEED * speed_multiplier) / sqrt(2)
	else:
		velocity.x = direction_h * config.SPEED * speed_multiplier
		velocity.y = direction_v * config.SPEED * speed_multiplier
	
	update_facing_direction(direction_h, direction_v)

func update_facing_direction(direction_h: int, direction_v: int):
	if direction_h < 0:
		current_facing_direction = FacingDirection.LEFT
	elif direction_h > 0:
		current_facing_direction = FacingDirection.RIGHT
	elif direction_v < 0:
		current_facing_direction = FacingDirection.UP
	elif direction_v > 0:
		current_facing_direction = FacingDirection.DOWN

func get_facing_direction_name(facing_direction: FacingDirection) -> String:
	match facing_direction:
		FacingDirection.LEFT:
			return "left"
		FacingDirection.RIGHT:
			return "right"
		FacingDirection.UP:
			return "up"
	return "down"
