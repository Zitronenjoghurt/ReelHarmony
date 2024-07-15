class_name Location
extends Node2D

@export var tile_map: TileMap
@export var water_layers: Array[int] = []

func _ready() -> void:
	add_to_group("location")
	_update_tile_water_collisions()

func _update_tile_water_collisions() -> void:
	for layer: int in water_layers:
		for cell: Vector2i in tile_map.get_used_cells(layer):
			var water_tile_data: TileData = tile_map.get_cell_tile_data(layer, cell)
			if water_tile_data == null:
				continue
				
			for check_layer: int in range(tile_map.get_layers_count() - 1, layer, -1):
				if check_layer in water_layers:
					continue
				
				var tile_data: TileData = tile_map.get_cell_tile_data(check_layer, cell)
				if tile_data != null:
					var source_id: int = tile_map.get_cell_source_id(layer, cell)
					var atlas_coords: Vector2i = tile_map.get_cell_atlas_coords(layer, cell)
					tile_map.set_cell(layer, cell, source_id, atlas_coords, 1)
					break
