extends Node

var map: MapBase

var tiles: Array = []
var unocupiedTiles: Array = []
var ocupiedTiles: Array = []


func _ready() -> void:
	pass

func readyUnocupiedTiles() -> void:
	return

	for t in map.tiles.values():
		tiles.append(t)
		unocupiedTiles.append(t)


func updateTiles():
	return

	unocupiedTiles.clear()
	ocupiedTiles.clear()

	for t in tiles:
		if t.isEmpty():
			unocupiedTiles.append(t)
		else:
			ocupiedTiles.append(t)



func map_to_world(tile: Vector2) -> Vector2:
	return map.map_to_world(tile)
