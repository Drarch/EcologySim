extends Node2D
class_name AnimalBase

onready var _actions = $Actions

var _migration: FuncRef
var _consumption: FuncRef
var _death: FuncRef
var _breeding: FuncRef

func _ready() -> void:
	_readyNullAction()
	_readyActions()


func _readyNullAction() -> void:
	_migration = funcref(self, "_nullAction")
	_consumption = funcref(self, "_nullAction")
	_death = funcref(self, "_nullAction")
	_breeding = funcref(self, "_nullAction")

func _readyActions() -> void:
	for a in _actions.get_children():
		a.activate(self)


func _actionNull() -> void:
	pass

func _actionDebug() -> void:
	pass


func migration():
	_migration.call_func()
	
func consumption():
	_consumption.call_func()
	
func death():
	_death.call_func()
	
func breeding():
	_breeding.call_func()
