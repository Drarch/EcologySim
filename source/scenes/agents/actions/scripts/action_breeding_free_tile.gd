extends ActionBase


func activate(animal: AnimalBase) -> void:
	.activate(animal)

	_animal._breeding.set_instance(self)
	_animal._breeding.set_function("action")
	

func action() -> void:
	var destTile: Tile = _animal.sector.getFreeTile()

	if !destTile:
		# print("No free tile")
		return
	
	if _animal.energy < _animal.energyBreedingCost:
		# print("Missing energy: ", _animal.energy)
		return
	
	_animal.reproduce(destTile)

	_animal.energy -= _animal.energyBreedingCost

