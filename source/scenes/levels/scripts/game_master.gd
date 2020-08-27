extends Node

onready var _animals: Array = $Animals.get_children()


func _ready() -> void:
	pass


func processTurn() -> void:
	migrate()


func migrate() -> void:
	for a in _animals:
		a.migration()