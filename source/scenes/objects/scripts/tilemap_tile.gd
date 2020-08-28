extends Reference
class_name Tile

enum TileView { GRASS = 0, NO_GRASS = 1}


var _map: TileMap

var position: Vector2
var animal: Node2D
var maxPlants: int = 1
var plants: int = 1

func _init(map: TileMap, _position: Vector2, var _maxPlants: int = 1):
	_map = map
	position = _position
	maxPlants = _maxPlants

	_updateView()


func regrow(amount: int):
	plants = plants + amount
	plants = int( min(plants, maxPlants) )
	_updateView()

func eat(amount: int = 1) -> bool:
	if plants >= amount:
		plants -= amount

		_updateView()
		return true

	return false


func _updateView():
	if plants > 0:
		_map.set_cellv(position, TileView.GRASS)
	else:
		_map.set_cellv(position, TileView.NO_GRASS)