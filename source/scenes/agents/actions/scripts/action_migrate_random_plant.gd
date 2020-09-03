extends ActionBase


func activate(animal: AnimalBase) -> void:
	.activate(animal)

	_animal._migration.set_instance(self)
	_animal._migration.set_function("action")
	

func action() -> void:

	var destTile: Tile = GlobalsMap.getFreeTile()

	if GlobalsMap.unocupiedTiles.empty():
		return
	
	## TODO: Plant

	var destSector: Sector = _animal.species.getSector(destTile) as Sector

	_animal.sector.removeAnimal(_animal.tile)
	destSector.addAnimal(destTile, _animal)
	_animal.move(destTile.position)
