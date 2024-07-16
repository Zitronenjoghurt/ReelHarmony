class_name BobberIndicator
extends Sprite2D

@onready var bobber_area: Area2D = %BobberArea

var initial_position: Vector2 = Vector2.ZERO
var success: bool = false
var current_location: Location

func activate() -> void:
	bobber_area.monitoring = true
	bobber_area.monitorable = true
	display_failure()
	show()
	initial_position = global_position
	success = false
	current_location = Utils.get_current_location()

func update(direction: Vector2, progress: float) -> void:
	global_position = initial_position + direction * progress * SaveManager.player_stats().MAX_ROD_THROW_DISTANCE
	
func display_success() -> void:
	modulate = Color(1, 1, 1, 1)
	success = true

func display_failure() -> void:
	modulate = Color(1, 1, 1, 0.5)
	success = false

func deactivate() -> Vector2:
	bobber_area.monitoring = false
	bobber_area.monitorable = false
	hide()
	initial_position = Vector2.ZERO
	current_location = null
	
	return global_position

func _on_bobber_area_body_entered(body: Node2D) -> void:
	if body is TileMap:
		display_success()

func _on_bobber_area_body_exited(body: Node2D) -> void:
	if body is TileMap:
		display_failure()
