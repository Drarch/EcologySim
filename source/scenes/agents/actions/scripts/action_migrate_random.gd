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

	destSector.addAnimal(_animal)
