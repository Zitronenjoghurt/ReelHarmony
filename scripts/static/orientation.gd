class_name Orientation
extends Object

enum Direction8 {
	E,
	NE,
	N,
	NW,
	W,
	SW,
	S,
	SE
}

static func get_vector_rotation_deg(vec: Vector2) -> int:
	var direction: Vector2 = vec.normalized()
	var angle: float = direction.angle()
	var degrees: float = rad_to_deg(angle)
	return int(degrees + 360) % 360

static func direction8_from_vec(vec: Vector2) -> Direction8:
	if vec.length() == 0:
		return Direction8.E
	var degrees: int = get_vector_rotation_deg(vec)
	var direction8: int = int((degrees + 22.5) / 45) % 8
	return Direction8.values()[direction8]

static func get_direction8_name(direction: Direction8) -> String:
	return Direction8.keys()[direction]

static func get_direction8_vector(direction: Direction8) -> Vector2i:
	match direction:
		Direction8.E:
			return Vector2i(1, 0)
		Direction8.NE:
			return Vector2i(1, -1)
		Direction8.N:
			return Vector2i(0, -1)
		Direction8.NW:
			return Vector2i(-1, -1)
		Direction8.W:
			return Vector2i(-1, 0)
		Direction8.SW:
			return Vector2i(-1, 1)
		Direction8.S:
			return Vector2i(0, 1)
		Direction8.SE:
			return Vector2i(1, 1)
	return Vector2i(0, 0)

static func get_direction8_rotation_deg(direction: Direction8) -> int:
	return direction * 45
