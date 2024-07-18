class_name FishData
extends Resource

enum SizeCategory {
	SMALL,
	MEDIUM,
	BIG
}

@export var name: String

@export var size_category: SizeCategory
@export var size_multiplier: float = 1.0

@export var sense_radius: float = 5.0

func get_size_category_name() -> String:
	match size_category:
		SizeCategory.BIG:
			return "big"
		SizeCategory.SMALL:
			return "small"
	return "medium"
