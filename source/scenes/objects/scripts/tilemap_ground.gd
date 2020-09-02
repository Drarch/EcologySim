extends TileMap
class_name MapBase

export(int, 0, 10000, 1) var tileMaxPlants: int = 10

var tiles: Dictionary = {}

func _ready():
	_readySelfReference()
	_readyTiles()

	GlobalsMap.readyUnocupiedSectors()


func _readySelfReference() -> void:
	GlobalsMap.map = self

func _readyTiles() -> void:
	var tilemapSize: Vector2 = self.get_used_rect().size

	# Init tiles
	for y in range(tilemapSize.y):
		for x in range(tilemapSize.x):
			tiles[Vector2(x,y)] = Tile.new( self, Vector2(x,y), tileMaxPlants )



