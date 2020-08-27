extends Node2D

var tilemap: TileMap

func _ready() -> void:
	pass

func _redayLabels() -> void:
	for pS in tilemap.sectors:
		for s in pS:
			var label: Label = Label.new()
			label.text = "S: " + str(s.position)
			label.set_position( tilemap.map_to_world( s.tiles[0] ))
			
			add_child(label)

			for t in s.tiles:
				label = Label.new()
				label.text = "T: " + str(t)
				label.set_position( tilemap.map_to_world( t ) - Vector2.UP * 20)
				
				add_child(label)

