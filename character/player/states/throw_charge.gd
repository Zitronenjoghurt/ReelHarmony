class_name RodThrowChargeStatePlayer
extends State

@export var player: Player

var throw_progress: float = 0.0
var throw_progress_rising: bool = true

func enter() -> void:
	player.velocity = Vector2.ZERO
	player.play_animation(player.Animations.ROD_THROW)
	throw_progress = 0.0
	throw_progress_rising = true
	player.rod_throw_bar.update(0)
	player.rod_throw_bar.show()
	player.fishing_rod.frame = 0

func update(delta: float) -> void:
	var current_animation_frame: int = player.style.get_current_frame()
	if current_animation_frame == Config.ROD_THROW_ANIMATION_STOP_FRAME_INDEX:
		player.style.pause()
		player.fishing_rod.pause()
		
	if throw_progress_rising:
		throw_progress += delta / Config.MAX_ROD_THROW_TIME_SEC
	else:
		throw_progress -= delta / Config.MAX_ROD_THROW_TIME_SEC
	
	if throw_progress < 0:
		throw_progress = 0
		throw_progress_rising = true
	elif throw_progress > 1:
		throw_progress = 1
		throw_progress_rising = false
	player.rod_throw_bar.update(throw_progress)
	
	if not Input.is_action_pressed("Throw_Rod"):
		player.current_rod_throw_strength = throw_progress
		transition_state.emit(self, "throw")
		return

func exit() -> void:
	player.rod_throw_bar.hide()
