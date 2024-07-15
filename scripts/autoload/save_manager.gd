extends Node

var state: SaveGame

func load_state(index: int) -> void:
	var save_game: SaveGame = SaveGame.load_save(index)
	state = save_game

func save_state() -> void:
	if state is SaveGame:
		state.save()
