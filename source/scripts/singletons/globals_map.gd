extends Node

var map: MapBase

var sectors: Array = []
var unocupiedSectors: Array = []
var ocupiedSectors: Array = []


func _ready() -> void:
	pass

func readyUnocupiedSectors() -> void:
	return

	for s in map.sectors.values():
			sectors.append(s)
			unocupiedSectors.append(s)


func updateSectors():
	return

	unocupiedSectors.clear()
	ocupiedSectors.clear()

	for s in sectors:
		if s.hasFreeTile():
			unocupiedSectors.append(s)
		else:
			ocupiedSectors.append(s)



func map_to_world(tile: Vector2) -> Vector2:
	return map.map_to_world(tile)
