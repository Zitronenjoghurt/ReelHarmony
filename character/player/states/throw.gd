class_name RodThrowStatePlayer
extends State

@export var player: Player

var was_success: bool = false

func enter() -> void:
	player.style.play()
	player.fishing_rod.play()
	
	was_success = false
	if player.bobber_indicator.success:
		_spawn_bobber(player.bobber_indicator.global_position)
		was_success = true
	player.bobber_indicator.deactivate()
		
func update(_delta: float) -> void:
	if not was_success:
		transition_state.emit(self, "idle")
		return

func _spawn_bobber(bobber_position: Vector2) -> void:
	var location: Location = Utils.get_current_location()
	var bobber_scene: Bobber = player.bobber_scene.instantiate()
	location.add_child(bobber_scene)
	bobber_scene.global_position = bobber_position
