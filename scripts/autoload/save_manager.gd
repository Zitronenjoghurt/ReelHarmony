extends Node

var state: SaveGame

func load_state(index: int):
	var save_game = SaveGame.load_save(index)
	state = save_game

func save_state():
	if state is SaveGame:
		state.save()
