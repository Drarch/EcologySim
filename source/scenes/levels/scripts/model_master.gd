extends Node

onready var _plot: Node2D = $CanvasLayer/plot

onready var _animals: Node = $Animals
onready var _species: Node = $Species
var turn: int = 1

export(bool) var randomizeSeed: bool = false

export(int, 0, 10000, 1) var plantsRegrowRate: int = 10

export(Array) var modelActionsOrder: Array = ["regrow"]
export(Array) var actionsOrder: Array = ["aging", "migration", "feeding", "breeding"]

func _ready() -> void:
	OS.set_window_maximized(true)

	if randomizeSeed:
		randomize()
	pass

func resetModel() -> void:
	for s in _species.get_children():
		s.readyAnimals()

func _zeroTurn() -> void:
	_processAction("migration")

func processTurn() -> void:
	for mA in modelActionsOrder:
		_processModelAction(mA)

	for a in actionsOrder:
		_processAction(a)

	statistics()

	turn += 1
	# _plot.force_update_data()

func _processModelAction(actionName: String):
	self.call(actionName)

func _processAction(actionName: String):
	for a in _animals.get_children():
		if a.isAlive && a.has_method(actionName):
			a.call(actionName)

func resetSectors():
	for t in GlobalsMap.ocupiedTiles:
		t.removeAnimal()

func regrow() -> void:
	for t in GlobalsMap.tiles:
		t.regrow(plantsRegrowRate)

func statistics():
	print("Turn: ", turn, ", Population: ", _animals.get_children().size())


func _on_Reset_pressed():
	resetModel()

	_zeroTurn()
