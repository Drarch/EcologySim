extends Node2D

export(bool) var drawGrid: bool = true
export(bool) var drawFrame: bool = true

export(Color) var gridColor: Color = Color.red
export(float, 0.1, 20.0, 0.1) var width: float = 1.0


var tilemap: TileMap


func _ready() -> void:
	if tilemap && drawGrid:
		_drawGrid()

func _draw() -> void:
	if !drawGrid:
		return

	_drawGrid()


func _drawGrid() -> void:
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