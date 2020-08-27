extends Node

onready var _animals: Array = $Animals.get_children()


func _ready() -> void:
	_firstTurn()


func _firstTurn() -> void:
	migrate()

func processTurn() -> void:
	migrate()


func migrate() -> void:
	for s in GlobalsMap.sectors:
		s.resetTiles()

	for a in _animals:
		a.migration()
