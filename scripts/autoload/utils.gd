extends Node

func is_direction_key_pressed() -> bool:
	return Input.is_action_pressed("Down") or Input.is_action_pressed("Up") or Input.is_action_pressed("Left") or Input.is_action_pressed("Right")

func get_input_direction_h() -> int:
	if Input.is_action_pressed("Left") and Input.is_action_pressed("Right"):
		return 0
	
	if Input.is_action_pressed("Right"):
		return 1

	if Input.is_action_pressed("Left"):
		return -1
	
	return 0

func get_input_direction_v() -> int:
	if Input.is_action_pressed("Down") and Input.is_action_pressed("Up"):
		return 0
	
	if Input.is_action_pressed("Down"):
		return 1

	if Input.is_action_pressed("Up"):
		return -1
	
	return 0

func get_facing_direction_name(facing_direction: Character.FacingDirection) -> String:
	match facing_direction:
		Character.FacingDirection.LEFT:
			return "left"
		Character.FacingDirection.RIGHT:
			return "right"
		Character.FacingDirection.UP:
			return "up"
	return "down"
