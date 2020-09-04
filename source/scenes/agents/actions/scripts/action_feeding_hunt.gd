extends ActionBase


func activate(animal: AnimalBase) -> void:
	.activate(animal)

	_animal._feeding.set_instance(self)
	_animal._feeding.set_function("action")
	

func action() -> void:
	var prey: AnimalBase = _animal.sector.getPrey(_animal.specieName)

	if !prey:
		return

	print("Hunted: ", prey.name)
	prey.death()
	_animal.energy += _animal.energyFeedingGain
