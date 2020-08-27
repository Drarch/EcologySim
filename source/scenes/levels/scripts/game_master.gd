extends Node

onready var _animals: Array = $Animals.get_children()


func _ready() -> void:
	migrate()


func migrate():
	for a in _animals:
		a.migration()