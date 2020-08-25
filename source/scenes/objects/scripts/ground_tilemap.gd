extends TileMap

onready var grid: Node2D = $Grid 

export(Vector2) var sectorScale = Vector2.ONE


func _ready():
	grid.tilemap = self
