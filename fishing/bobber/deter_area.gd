class_name BobberDeterArea
extends Area2D

var age: float = 0.0

func _physics_process(delta: float) -> void:
	age += delta
	if age > Config.BOBBER_DETER_TIME_SEC:
		kill()

func kill() -> void:
	queue_free()
	get_parent().remove_child(self)
