extends Node
class_name SpeciesBase


export(int, 0, 100) var startingAnimals: int = 1
export(Vector2) var sectorScale = Vector2.ONE
var sectors: Dictionary = {}
var sectorSize: Vector2 = Vector2.ZERO

onready var animal = $Animal
onready var _grid: Node2D = $Visuals/Grid

export(NodePath) var tilemapPath: NodePath
var tilemap: TileMap

func _ready() -> void:
	tilemap = get_node(tilemapPath)
	assert(tilemap is TileMap, "Tilemap Path, must be set to TileMap node")

	_readySectors()
	_readyGrid()


func _readyGrid() -> void:
	_grid.init(self, tilemap)

func _readySectors() -> void:
	var tilemapSize: Vector2 = tilemap.get_used_rect().size
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
			sectors[Vector2(sX, sY)].tiles.append( tilemap.tiles[Vector2(x, y)] )
