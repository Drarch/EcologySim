extends Node

onready var _animals: Node = $Animals
var turn: int = 1

export(int, 0, 10000, 1) var plantsRegrowRate: int = 10

func _ready() -> void:
	_zeroTurn()


func _zeroTurn() -> void:
	migrate()

func processTurn() -> void:
	regrow()
	aging()
	migrate()
	feeding()
	breeding()

	statistics()

	turn += 1

func regrow() -> void:
	for t in GlobalsMap.map.tiles.values():
		t.regrow(plantsRegrowRate)

func aging() -> void:
	for a in _animals.get_children():
		a.aging()

func breeding() -> void:
	for a in _animals.get_children():
		a.breeding()

func feeding() -> void:
	for a in _animals.get_children():
		a.feeding()

func migrate() -> void:
	for s in GlobalsMap.sectors:
		s.resetTiles()

	for a in _animals.get_children():
		a.migration()


func statistics():
	print("Population: ", _animals.get_children().size())
