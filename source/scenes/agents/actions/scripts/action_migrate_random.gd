extends ActionBase


func activate(animal: AnimalBase) -> void:
	.activate(animal)

	_animal._migration.set_instance(self)
	_animal._migration.set_function("action")
	

func action() -> void:
	if GlobalsMap.unocupiedSectors.empty():
		return
	
	var sectors := GlobalsMap.unocupiedSectors
	var destSector: Sector = sectors[randi() % sectors.size()] as Sector
	var destTile: Tile = destSector.getFreeTile()

	destSector.addAnimal(destTile, _animal)
	_animal.move(destTile.position)
