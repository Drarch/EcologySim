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


func addAnimal(animal: AnimalBase, tile: Vector2) -> bool:
	if !animal || !hasFreeTile():
		return false

	animals[tile] = animal
	animal.tile = tile

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
	animals.erase(tile)


func resetTiles() -> void:
	if !hasFreeTile():
		GlobalsMap.unnocupiedSectors.append(self)
		GlobalsMap.ocupiedSectors.erase(self)
		
	animals.clear()
