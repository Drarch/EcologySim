extends Node
class_name Statistics


var population: Dictionary = {}
var populationTurn: Dictionary

var turnStatistics: Array

func _ready() -> void:
	reset()

func reset() -> void:
	population.clear()
	populationTurn.clear()

	population["All"] = 0

func resetTurnStatistics():
	for s in turnStatistics:
		population[s] = 0

func registerSpecie(specieName: String) -> void:
	population[specieName] = 0
	population[specieName + "Born"] = 0
	population[specieName + "Died"] = 0

	turnStatistics.append(specieName + "Born")
	turnStatistics.append(specieName + "Died")

func addPopulation(specieName: String) -> void:
	population["All"] += 1
	population[specieName] += 1
	population[specieName + "Born"] += 1


func removePopulation(specieName: String) -> void:
	population["All"] -= 1
	population[specieName] -= 1
	population[specieName + "Died"] += 1

func registerHunted(predator: String, prey: String) -> void:
	var key: String = predator + " -> " + prey

	if !population.has(key):
		population[key] = 0
		turnStatistics.append(key)

	population[key] += 1

func snapshootPopulation(turn: int) -> void:
	populationTurn[turn] = population.duplicate()
