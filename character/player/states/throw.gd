class_name RodThrowStatePlayer
extends State

@export var player: Player

func enter() -> void:
	player.style.play()
	player.fishing_rod.play()
