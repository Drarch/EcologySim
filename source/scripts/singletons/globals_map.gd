extends Node

const WRONG_VECTOR: Vector2 = Vector2(-1, -1)

var map: MapBase

var sectors: Array = []
var unnocupiedSectors: Array = []
var ocupiedSectors: Array = []


func _ready() -> void:
	pass

func readyUnnocupiedSectors() -> void:
	for sA in map.sectors:
		for s in sA:
			sectors.append(s)
			unnocupiedSectors.append(s)


func updateSectors():
	unnocupiedSectors.clear()
	ocupiedSectors.clear()

	for s in sectors:
		if s.hasFreeTile():
			unnocupiedSectors.append(s)
		else:
			ocupiedSectors.append(s)



func map_to_world(tile: Vector2) -> Vector2:
	return map.map_to_world(tile)
