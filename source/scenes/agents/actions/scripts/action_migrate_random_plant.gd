extends ActionBase


func activate(animal: AnimalBase) -> void:
	.activate(animal)

	_animal._migration.set_instance(self)
	_animal._migration.set_function("action")
	

func action() -> void:
	var sectors: Array = _animal.species.unocupiedSectors

	if sectors.empty():
		return
	
	var destSector: Sector = sectors[randi() % sectors.size()] as Sector
	var destTile: Tile = destSector.getFreePlantTile()

	_animal.sector.removeAnimal(_animal.tile)
	destSector.addAnimal(destTile, _animal)
	_animal.move(destTile.position)
