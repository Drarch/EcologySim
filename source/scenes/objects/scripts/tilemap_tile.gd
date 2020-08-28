extends Reference
class_name Tile

var _map: TileMap

var position: Vector2
var animal: Node2D
var plants: int = 1

func _init(map: TileMap, _position: Vector2, var _plants: int = 1):
	_map = map
	position = _position
	plants = _plants

func regrow():
	pass