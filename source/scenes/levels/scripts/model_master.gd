extends Node

onready var _plot: Node2D = $CanvasLayer/plot

onready var _animals: Node = $Animals
onready var _species: Node = $Species
var turn: int = 1

export(int, 0, 10000, 1) var plantsRegrowRate: int = 10

export(Array) var modelActionsOrder: Array = ["regrow", "resetSectors"]
export(Array) var actionsOrder: Array = ["aging", "migration", "feeding", "breeding"]

func _ready() -> void:
	_zeroTurn()

func _zeroTurn() -> void:
	_processAction("migration")

func processTurn() -> void:
	for mA in modelActionsOrder:
		_processModelAction(mA)

	for a in actionsOrder:
		_processAction(a)

	statistics()

	turn += 1
	_plot.force_update_data()

func _processModelAction(actionName: String):
	self.call(actionName)

func _processAction(actionName: String):
	for a in _animals.get_children():
		if a.has_method(actionName):
			a.call(actionName)

func resetSectors():
	for s in GlobalsMap.sectors:
		s.removeAnimals()

func regrow() -> void:
	for t in GlobalsMap.map.tiles.values():
		t.regrow(plantsRegrowRate)

func statistics():
	print("Population: ", _animals.get_children().size())
