extends Node

onready var _animals: Node = $Animals


func _ready() -> void:
	_firstTurn()


func _firstTurn() -> void:
	migrate()

func processTurn() -> void:
	aging()
	migrate()
	breeding()


func aging() -> void:
	for a in _animals.get_children():
		a.aging()

func breeding() -> void:
	for a in _animals.get_children():
		a.breeding()

	print("Population: ", _animals.get_children().size())

func migrate() -> void:
	for s in GlobalsMap.sectors:
		s.resetTiles()

	for a in _animals.get_children():
		a.migration()
