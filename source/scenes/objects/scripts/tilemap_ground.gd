extends TileMap

onready var _grid: Node2D = $Grid 

export(Vector2) var sectorScale = Vector2.ONE

var sectors: Array = []
var sectorSize: Vector2 = Vector2.ZERO 

func _ready():
	_readySectors()

	_grid.tilemap = self



func _readySectors():
	var tilemapSize: Vector2 = self.get_used_rect().size
	sectorSize = tilemapSize / self.sectorScale

	# Init sectors
	for x in range(sectorSize.x):
		sectors.append( [] )

		for y in range(sectorSize.y):
			sectors[x].append( Sector.new() )

	# Set tiles within sectors
	for x in range(tilemapSize.x):
		for y in range(tilemapSize.y):
			var sX: int = int(x / sectorScale.x)
			var sY: int = int(y / sectorScale.y)
			sectors[sX][sY].tiles.append( Vector2(x, y) )

			print(Vector2(x, y), ", ", Vector2(sX, sY), ": ", sectors[sX][sY].tiles)

