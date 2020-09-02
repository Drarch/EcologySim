extends Node2D

var tilemap: TileMap
var species: SpeciesBase

func _ready() -> void:
	pass

func _redayLabels() -> void:
	for s in species.sectors.values():
		var label: Label = Label.new()
		label.text = "S: " + str(s.position)
		label.set_position( tilemap.position + tilemap.map_to_world( s.position * species.sectorScale ))
		
		add_child(label)

		for t in s.tiles:
			label = Label.new()
			label.text = "T: " + str(t.position)
			label.set_position( tilemap.position + tilemap.map_to_world( t.position ) - Vector2.UP * 20)
			
			add_child(label)
