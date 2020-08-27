extends Node2D

export(bool) var drawSectorGrid: bool = true
export(bool) var drawTileGrid: bool = false
export(bool) var drawFrame: bool = true

export(Color) var gridColor: Color = Color.red
export(float, 0.1, 20.0, 0.1) var width: float = 1.0


var tilemap: TileMap


func _ready() -> void:
	pass

func _draw() -> void:
	if drawSectorGrid:
		_drawSectorGrid()

	if drawTileGrid:
		_drawTileGrid()

	


func _drawSectorGrid() -> void:
	var tilemapSize: Vector2 = tilemap.get_used_rect().size
	var sectorSize: Vector2 = tilemap.cell_size * tilemap.sectorScale
	var gridSize: Vector2 = tilemapSize / tilemap.sectorScale

	var mapSize: Vector2 = sectorSize * gridSize
	
	var start: int = 0 if drawFrame else 1
	var end: int = 1 if drawFrame else 0

	# draw_set_transform(Vector2.ZERO, 0, sectorSize)

	for y in range(start, int(gridSize.y) + end):
		var step:int = int(sectorSize.y) * y
		draw_line(Vector2(0, step), Vector2(mapSize.x, step), gridColor, width)

	for x in range(start, int(gridSize.x) + end):
		var step:int = int(sectorSize.x) * x
		draw_line(Vector2(step, 0), Vector2(step, mapSize.y), gridColor, width)


func _drawTileGrid() -> void:
	var tilemapSize: Vector2 = tilemap.get_used_rect().size

	var mapSize: Vector2 = tilemap.cell_size * tilemapSize
	
	var start: int = 0 if drawFrame else 1
	var end: int = 1 if drawFrame else 0

	for y in range(start, tilemapSize.y + end):
		var step:int = int(tilemap.cell_size .y) * y
		draw_line(Vector2(0, step), Vector2(mapSize.x, step), gridColor, width/2.0)

	for x in range(start, tilemapSize.x + end):
		var step:int = int(tilemap.cell_size .x) * x
		draw_line(Vector2(step, 0), Vector2(step, mapSize.y), gridColor, width/2.0)