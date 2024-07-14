class_name SaveGame
extends Resource

@export var index: int
@export var player_stats: PlayerStats = PlayerStats.new()

static func create_new(file_index: int) -> SaveGame:
	var save_game = SaveGame.new()
	save_game.index = file_index
	return save_game

static func get_save_path(file_index: int) -> String:
	return "user://savegame_"+ str(file_index) +".tres"

static func save_file_exists(file_index: int) -> bool:
	return ResourceLoader.exists(get_save_path(file_index))

static func load_save(file_index: int) -> SaveGame:
	if not save_file_exists(file_index):
		return SaveGame.create_new(file_index)
	var path = get_save_path(file_index)
	return load(path)

func save():
	var path = SaveGame.get_save_path(index)
	ResourceSaver.save(self, path)
