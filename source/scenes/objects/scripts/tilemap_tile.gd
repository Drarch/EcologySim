extends Reference
class_name Tile

enum TileView { GRASS = 1, NO_GRASS = 2}


var _map: TileMap

var position: Vector2

var maxPlants: int
var plants: int = 10

var animal: Node2D


func _init(map: TileMap, _position: Vector2, var _maxPlants: int = 10):
	_map = map
	position = _position
	maxPlants = _maxPlants

	_updateView()

func isEmpty() -> bool:
	return animal == null

func hasPlant() -> bool:
	return plants > 0

func hasFreePlant() -> bool:
	return isEmpty() && hasPlant()

func addAnimal(_animal: Node2D) -> void:
	animal = _animal
	animal.tile = self

	GlobalsMap.unocupiedTiles.erase(self)
	GlobalsMap.ocupiedTiles.append(self)

func removeAnimal() -> void:
	if animal:
		animal.tile = null
		animal = null

	GlobalsMap.unocupiedTiles.append(self)
	GlobalsMap.ocupiedTiles.erase(self)


func regrow(amount: int = 10):
	plants = plants + amount
	plants = int( min(plants, maxPlants) )
	_updateView()

func eat(amount: int = 10) -> int:
	var eated: int = int( min(plants, amount) )
	plants -= eated

	_updateView()

	return eated


func _updateView():
	if plants > 0:
		_map.set_cellv(position, TileView.GRASS)
	else:
		_map.set_cellv(position, TileView.NO_GRASS)
