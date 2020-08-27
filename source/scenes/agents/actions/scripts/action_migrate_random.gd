extends ActionBase


func activate(animal: AnimalBase) -> void:
	.activate(animal)

	_animal._migration.set_instance(self)
	_animal._migration.set_function("action")
	

func action() -> void:
	if GlobalsMap.unnocupiedSectors.empty():
		return
	
	var sectors := GlobalsMap.unnocupiedSectors
	var destSector: Sector = sectors[randi() % sectors.size()] as Sector
	var destTile: Vector2 = destSector.getFreeTile()

	if destTile != GlobalsMap.WRONG_VECTOR:
		destSector.addAnimal(_animal, destTile)

		var dest = GlobalsMap.map_to_world(destTile)
		# var dest = GlobalsMap.map_to_world(Vector2.ZERO)
		move(dest + GlobalsMap.map.position + Vector2.ONE * 32)


func move(destination: Vector2) -> void:
	_animal.position = destination
