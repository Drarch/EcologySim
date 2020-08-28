extends ActionBase


func activate(animal: AnimalBase) -> void:
	.activate(animal)

	_animal._aging.set_instance(self)
	_animal._aging.set_function("action")
	

func action() -> void:
	if _animal.age >= _animal.maxAge || _animal.energy < _animal.energyLivingCost:
		_animal.death()
		return

	_animal.energy -= _animal.energyLivingCost
	_animal.age += 1
