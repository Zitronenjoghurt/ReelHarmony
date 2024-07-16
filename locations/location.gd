class_name Location
extends Node2D

@export var tile_map: TileMap
@export var water_layers: Array[int] = []

func _ready() -> void:
	add_to_group("location")
	_update_tile_water_collisions()

# Will remove the water collision from water tiles that are overlapped by non-water tiles
func _update_tile_water_collisions() -> void:
	if len(water_layers) == 0:
		return
	
	var top_water_cells: Array[Vector2i] = []
	
	# Sorts the water layers to start at the greatest
	water_layers.sort_custom(func(a: int,b: int) -> bool: return a > b)
	
	for layer: int in water_layers:
		for cell: Vector2i in tile_map.get_used_cells(layer):
			# Cell is already overlapped by a top-most waterlayer, no changes have to be made
			if cell in top_water_cells:
				tile_map.erase_cell(layer, cell)
				continue
			
			var water_tile_data: TileData = tile_map.get_cell_tile_data(layer, cell)
			# If theres no water tile at the current cell and layer, continue
			if water_tile_data == null:
				continue
			
			var collision_removed: bool = false
			for check_layer: int in range(tile_map.get_layers_count() - 1, layer, -1):
				if check_layer in water_layers:
					continue
				
				var tile_data: TileData = tile_map.get_cell_tile_data(check_layer, cell)
				if tile_data != null:
					# A non-water cell above the current cell was found, the water collision is to be removed
					# This is achieved by setting the alternative_tile_id to 1, which are alternative water tiles without the water collision
					var source_id: int = tile_map.get_cell_source_id(layer, cell)
					var atlas_coords: Vector2i = tile_map.get_cell_atlas_coords(layer, cell)
					tile_map.set_cell(layer, cell, source_id, atlas_coords, 1)
					collision_removed = true
					break
			
			# This ensures that cells that already had a successful check for a top-layer water tile won't be checked again
			if not collision_removed:
				top_water_cells.append(cell)
