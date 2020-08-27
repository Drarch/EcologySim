extends ActionBase


func activate(animal: AnimalBase) -> void:
	.activate(animal)

	_animal._migration.set_function("action")
	

func action() -> void:
	print("migration")
