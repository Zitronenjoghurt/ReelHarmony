class_name BobberIndicator
extends TextureRect

var initial_position: Vector2 = Vector2.ZERO
var current_location: Location

func activate() -> void:
	show()
	initial_position = global_position
	current_location = Utils.get_current_location()

func update(direction: Vector2, progress: float) -> void:
	global_position = initial_position + direction * progress * SaveManager.player_stats().MAX_ROD_THROW_DISTANCE
	
func display_success() -> void:
	self_modulate = Color(1, 1, 1, 1)

func display_failure() -> void:
	self_modulate = Color(1, 1, 1, 0.5)

func deactivate() -> void:
	hide()
	initial_position = Vector2.ZERO
	current_location = null

func _on_bobber_area_body_entered(body: Node2D) -> void:
	print(body)
