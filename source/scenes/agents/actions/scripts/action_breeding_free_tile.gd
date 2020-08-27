extends ActionBase


func activate(animal: AnimalBase) -> void:
	.activate(animal)

	_animal._breeding.set_instance(self)
	_animal._breeding.set_function("action")
	

func action() -> void:
	if !_animal.sector.hasFreeTile():
		return
	
	var newAnimal = _animal.duplicate()
	_animal.get_parent().add_child(newAnimal)
	_animal.sector.addAnimal(newAnimal)
