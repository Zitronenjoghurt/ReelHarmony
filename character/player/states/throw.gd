class_name RodThrowStatePlayer
extends State

@export var player: Player

var was_success: bool = false

func enter() -> void:
	player.style.play()
	player.fishing_rod.play()
	
	was_success = false
	if player.bobber_indicator.success:
		_spawn_bobber()
		was_success = true
		
func update(_delta: float) -> void:
	if not was_success:
		transition_state.emit(self, "idle")
		return

func _spawn_bobber() -> void:
	var location: Location = Utils.get_current_location()
	var bobber_scene: Bobber = player.bobber_scene.instantiate()
	var bobber_position: Vector2 = player.bobber_indicator.deactivate()
	location.add_child(bobber_scene)
	bobber_scene.global_position = bobber_position
