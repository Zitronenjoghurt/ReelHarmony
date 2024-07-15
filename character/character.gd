class_name Character
extends CharacterBody2D

@export var config: CharacterConfig

@onready var style: CharacterStyle = %Style

enum FacingDirection {
	RIGHT,
	LEFT,
	DOWN,
	UP
}

var current_facing_direction: FacingDirection = FacingDirection.DOWN

func _ready() -> void:
	_load_style()
	
func _physics_process(_delta: float) -> void:
	move_and_slide()
	
func _load_style() -> void:
	if not config.STYLE is CharacterStyleConfig:
		return
	style.build(config.STYLE)

func move(direction_h: int, direction_v: int, speed_multiplier: float = 1.0) -> void:
	if direction_h != 0 and direction_v != 0:
		velocity.x = (direction_h * config.SPEED * speed_multiplier) / sqrt(2)
		velocity.y = (direction_v * config.SPEED * speed_multiplier) / sqrt(2)
	else:
		velocity.x = direction_h * config.SPEED * speed_multiplier
		velocity.y = direction_v * config.SPEED * speed_multiplier
	
	update_facing_direction(direction_h, direction_v)

func update_facing_direction(direction_h: int, direction_v: int) -> void:
	if direction_h < 0:
		current_facing_direction = FacingDirection.LEFT
	elif direction_h > 0:
		current_facing_direction = FacingDirection.RIGHT
	elif direction_v < 0:
		current_facing_direction = FacingDirection.UP
	elif direction_v > 0:
		current_facing_direction = FacingDirection.DOWN
