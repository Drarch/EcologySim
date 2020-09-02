extends Node2D

export(bool) var drawSectorGrid: bool = true
export(bool) var drawTileGrid: bool = false
export(bool) var drawFrame: bool = true

export(Color) var gridColor: Color = Color.red
export(float, 0.1, 20.0, 0.1) var width: float = 1.0


var tilemap: TileMap
var species: SpeciesBase

func init(_species: SpeciesBase, _tilemap: TileMap) -> void:
	species = _species
	tilemap = _tilemap

	_readyDebug()
	update()

func _ready() -> void:
	pass

func _readyDebug() -> void:
	if $Debug:
		$Debug.tilemap = tilemap
		$Debug.species = species
		$Debug._redayLabels()


func _draw() -> void:
	if !tilemap:
		return

	if drawSectorGrid:
		_drawSectorGrid()

	if drawTileGrid:
		_drawTileGrid()

func _drawSectorGrid() -> void:
	var tilemapSize: Vector2 = tilemap.get_used_rect().size
	var sectorSize: Vector2 = tilemap.cell_size * species.sectorScale
	var gridSize: Vector2 = tilemapSize / species.sectorScale

	var mapSize: Vector2 = sectorSize * gridSize
	
	var start: int = 0 if drawFrame else 1
	var end: int = 1 if drawFrame else 0

	var gridBegin = tilemap.position
	var gridEnd = tilemap.position + mapSize
	# draw_set_transform(Vector2.ZERO, 0, sectorSize)

	for y in range(start, int(gridSize.y) + end):
		var step:float = gridBegin.y + (sectorSize.y * y)
		draw_line(Vector2(gridBegin.x, step), Vector2(gridEnd.x, step), gridColor, width)

	for x in range(start, int(gridSize.x) + end):
		var step:float = gridBegin.x + (sectorSize.x * x)
		draw_line(Vector2(step, gridBegin.y), Vector2(step, gridEnd.y), gridColor, width)


func _drawTileGrid() -> void:
	var tilemapSize: Vector2 = tilemap.get_used_rect().size

	var mapSize: Vector2 = tilemap.cell_size * tilemapSize
	
	var start: int = 0 if drawFrame else 1
	var end: int = 1 if drawFrame else 0

	var gridBegin = tilemap.position
	var gridEnd = tilemap.position + mapSize

	for y in range(start, tilemapSize.y + end):
		var step:float = gridBegin.y + (tilemap.cell_size.y * y)
		draw_line(Vector2(gridBegin.x, step), Vector2(gridEnd.x, step), gridColor, width/2.0)

	for x in range(start, tilemapSize.x + end):
		var step:float = gridBegin.x + (tilemap.cell_size.x * x)
		draw_line(Vector2(step, gridBegin.y), Vector2(step, gridEnd.y), gridColor, width/2.0)
