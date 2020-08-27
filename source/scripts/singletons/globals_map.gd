extends Node

const WRONG_VECTOR: Vector2 = Vector2(-1, -1)

var map: MapBase

var sectors: Array = []
var unocupiedSectors: Array = []
var ocupiedSectors: Array = []


func _ready() -> void:
	pass

func readyunocupiedSectors() -> void:
	for sA in map.sectors:
		for s in sA:
			sectors.append(s)
			unocupiedSectors.append(s)


func updateSectors():
	unocupiedSectors.clear()
	ocupiedSectors.clear()

	for s in sectors:
		if s.hasFreeTile():
			unocupiedSectors.append(s)
		else:
			ocupiedSectors.append(s)



func map_to_world(tile: Vector2) -> Vector2:
	return map.map_to_world(tile)
