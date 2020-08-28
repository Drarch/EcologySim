extends Reference
class_name Sector

var position: Vector2
var tiles: Array = []

var animals: Dictionary


func _init(_position: Vector2):
	position = _position


func hasFreeTile() -> bool:
	return animals.size() < tiles.size()


func getFreeTile() -> Tile:
	if !hasFreeTile():
		return null

	var i: int = 0
	var result: Tile = tiles[i]

	while result.animal:
		i += 1
		result = tiles[i]

	return result

func getFreePlantTile() -> Tile:
	if !hasFreeTile():
		return null

	var result:Tile = getFreeTile()

	for t in tiles:
		if !t.animal && t.plants > 0:
			result = t
			break

	return result 


# Adds animal to sector and move it to designated tile
func addAnimal(tile: Tile, animal: Node2D) -> bool:
	if !animal || tile.animal:
		return false

	tile.animal = animal
	animals[tile] = animal
	animal.tile = tile
	animal.sector = self

	_moveAnimal(animal, tile.position)

	if !hasFreeTile():
		GlobalsMap.unocupiedSectors.erase(self)
		GlobalsMap.ocupiedSectors.append(self)

	return true

func removeAnimal(tile: Tile) -> void:
	if !animals.has(tile):
		return

	if !hasFreeTile():
		GlobalsMap.unocupiedSectors.append(self)
		GlobalsMap.ocupiedSectors.erase(self)
	
	animals[tile].tile.animal = null
	animals[tile].tile = null
	animals[tile].sector = null
	animals.erase(tile)


func resetTiles() -> void:
	if !hasFreeTile(): #Because otherwise this sector is unocupied befoer reset.
		GlobalsMap.unocupiedSectors.append(self)
		GlobalsMap.ocupiedSectors.erase(self)
	
	for t in tiles:
		t.animal = null

	animals.clear()



func _moveAnimal(animal: Node2D, tilePosition: Vector2) -> void:
	var dest = GlobalsMap.map_to_world(tilePosition)
	animal.position = dest + GlobalsMap.map.position + Vector2.ONE * 32
