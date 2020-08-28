extends ActionBase


func activate(animal: AnimalBase) -> void:
	.activate(animal)

	_animal._feeding.set_instance(self)
	_animal._feeding.set_function("action")
	

func action() -> void:
	_animal.energy = _animal.tile.eat()
