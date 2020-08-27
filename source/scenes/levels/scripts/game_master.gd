extends Node

onready var _animals: Array = $Animals.get_children()


func _ready() -> void:
	_firstTurn()


func _firstTurn() -> void:
	migrate()

func processTurn() -> void:
	migrate()
	breeding()


func breeding() -> void:
	for a in _animals:
		a.breeding()

	_animals = $Animals.get_children()
	print("Population: ", _animals.size())

func migrate() -> void:
	for s in GlobalsMap.sectors:
		s.resetTiles()

	for a in _animals:
		a.migration()
