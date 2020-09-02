extends ActionBase


func activate(animal: AnimalBase) -> void:
	.activate(animal)

	_animal._migration.set_instance(self)
	_animal._migration.set_function("action")
	

func action() -> void:
	if GlobalsMap.unocupiedTiles.empty():
		return
	
	var tiles := GlobalsMap.unocupiedTiles
	var destTile: Tile = tiles[randi() % tiles.size()] as Tile
	var destSector: Sector = _animal.species.getSector(destTile) as Sector

	destSector.addAnimal(destTile, _animal)
	_animal.move(destTile.position)
