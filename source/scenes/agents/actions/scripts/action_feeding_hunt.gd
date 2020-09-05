extends ActionBase


func activate(animal: AnimalBase) -> void:
	.activate(animal)

	_animal._feeding.set_instance(self)
	_animal._feeding.set_function("action")
	

func action() -> void:
	var prey: AnimalBase = _animal.sector.getPrey(_animal.specieName)

	if !prey:
		return

	GlobalsMap.statistics.registerHunted(_animal.specieName, prey.specieName)
	
	prey.death()
	_animal.energy += _animal.energyFeedingGain

