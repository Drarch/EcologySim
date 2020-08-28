extends TileMap
class_name MapBase

onready var _grid: Node2D = $Grid

export(Vector2) var sectorScale = Vector2.ONE

var tiles: Dictionary = {}
var sectors: Dictionary = {}
var sectorSize: Vector2 = Vector2.ZERO 

func _ready():
	_readySelfReference()
	_readyTiles()
	_readySectors()

	GlobalsMap.readyUnocupiedSectors()
	
	_readyDebug()


func _readySelfReference() -> void:
	GlobalsMap.map = self
	_grid.tilemap = self

func _readyTiles() -> void:
	var tilemapSize: Vector2 = self.get_used_rect().size

	# Init tiles
	for y in range(tilemapSize.y):
		for x in range(tilemapSize.x):
			tiles[Vector2(x,y)] = Tile.new( self, Vector2(x,y) )

func _readySectors() -> void:
	var tilemapSize: Vector2 = self.get_used_rect().size
	sectorSize = tilemapSize / self.sectorScale

	# Init sectors
	for y in range(sectorSize.y):
		for x in range(sectorSize.x):
			sectors[Vector2(x,y)] = Sector.new( Vector2(x,y) )

	# Set tiles within sectors
	for y in range(tilemapSize.y):
		for x in range(tilemapSize.x):
			var sX: int = int(x / sectorScale.x)
			var sY: int = int(y / sectorScale.y)
			sectors[Vector2(sX, sY)].tiles.append( tiles[Vector2(x, y)] )


func _readyDebug() -> void:
	$Debug.tilemap = self
	$Debug._redayLabels()
