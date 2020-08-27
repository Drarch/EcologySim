extends Reference
class_name Sector

var position: Vector2
var tiles: Array = []

var animals: Dictionary
# var animalsOccupied: int = 0

func _init(_position: Vector2):
	position = _position


func hasFreeTile() -> bool:
	return animals.size() < tiles.size()


func getFreeTile() -> Vector2:
	if !hasFreeTile():
		return GlobalsMap.WRONG_VECTOR

	var i: int = 0
	var result: Vector2 = tiles[i]

	while animals.has(result):
		i += 1
		result = tiles[i]

	return result


# Adds animal to sector and move it to designated tile
func addAnimal(animal: Node2D) -> bool:
	if !animal || !hasFreeTile():
		return false

	var tile: Vector2 = self.getFreeTile()

	animals[tile] = animal
	animal.tile = tile
	animal.sector = self

	_moveAnimal(animal, tile)

	if !hasFreeTile():
		GlobalsMap.unnocupiedSectors.erase(self)
		GlobalsMap.ocupiedSectors.append(self)

	return true

func removeAnimal(tile: Vector2) -> void:
	if !animals.has(tile):
		return

	if !hasFreeTile():
		GlobalsMap.unnocupiedSectors.append(self)
		GlobalsMap.ocupiedSectors.erase(self)
	
	animals[tile].tile = GlobalsMap.WRONG_VECTOR
	animals[tile].sector = null
	animals.erase(tile)


func resetTiles() -> void:
	if !hasFreeTile():
		GlobalsMap.unnocupiedSectors.append(self)
		GlobalsMap.ocupiedSectors.erase(self)
		
	animals.clear()



func _moveAnimal(animal: Node2D, tile: Vector2) -> void:
	var dest = GlobalsMap.map_to_world(tile)
	animal.position = dest + GlobalsMap.map.position + Vector2.ONE * 32
