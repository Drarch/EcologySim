extends Node2D
class_name AnimalBase

onready var _actions = $Actions

var _migration: FuncRef
var _feeding: FuncRef
var _aging: FuncRef
var _breeding: FuncRef

var tile: Vector2 
var sector: Sector


export(String) var specieName : String = "Speciement" 

export(int, 1, 20, 1) var maxAge:int = 3
var age: int = 0


func _ready() -> void:
	_readyEmptyActions("_actionDebug")
	_readyActions()


func _readyEmptyActions(actionName: String) -> void:
	_migration = funcref(self, actionName)
	_feeding = funcref(self, actionName)
	_aging = funcref(self, actionName)
	_breeding = funcref(self, actionName)


func _readyActions() -> void:
	for a in _actions.get_children():
		a.activate(self)


func _actionNull() -> void:
	pass

func _actionDebug() -> void:
	print(self.name, ": function not set")


func migration():
	_migration.call_func()
	
func feeding():
	_feeding.call_func()
	
func aging():
	_aging.call_func()
	
func breeding():
	_breeding.call_func()


func death():
	self.sector.removeAnimal(self.tile)
	self.queue_free()
