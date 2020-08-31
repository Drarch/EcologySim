tool
extends Node2D

export(NodePath) var data_path
export(int)  var history_size := 100
#export(bool) var combine_data_over_size := false 
export(bool) var scale_data := false
export(bool) var record_only_on_change := false

export(Vector2) var plot_size := Vector2(100.0, 100.0) setget set_plot_size

export(int)     var axis_line_width := 1 setget set_axis_line_width
export(Color)   var axis_line_color := Color.white setget set_axis_line_color

export(Vector2) var grid_divisions := Vector2(4.0,4.0) setget set_grid_divisions
export(int)     var grid_width := 1 setget set_grid_line_width
export(Color)   var grid_color := Color(1.0,1.0,1.0,0.3) setget set_grid_line_color

export(int)     var plot_line_width := 1 setget set_plot_line_width
export(Color)   var plot_line_color := Color.yellow setget set_plot_line_color

var data_handle:Node
var data_array = []

var data_size_curent :int = 0  

var value_current    :int = 0
var value_previous   :int = 0
var value_max        :int = 0

func _ready():
	if data_path:
		data_handle = get_node(data_path)

func _process(delta):
	if !Engine.is_editor_hint():
		value_current = data_handle.get_child_count()
		if record_only_on_change:
			if value_current != value_previous:
				value_previous = value_current
				update_max_value()
				update_data()
		else:
			update_max_value()
			update_data()

func force_update_data():
	value_previous = value_current
	update_max_value()
	update_data()

func update_max_value():
	if value_current > value_max:
		value_max = value_current

func update_data():
	if data_array.size() >= history_size:
		data_array.remove(0)
	data_array.append(value_current)

	update()
	
func set_path(value:Node2D):
	data_path = value
	data_handle = get_node(data_path)

func set_axis_line_width(value:int):
	axis_line_width = value
	update()

func set_axis_line_color(value:Color):
	axis_line_color = value
	update()


func set_grid_divisions(value:Vector2):
	grid_divisions = value
	update()
	
func set_grid_line_width(value:int):
	grid_width = value
	update()

func set_grid_line_color(value:Color):
	grid_color = value
	update()
	
func set_plot_line_width(value:int):
	plot_line_width = value
	update()
	
func set_plot_line_color(value:Color):
	plot_line_color = value
	update()
		
func set_plot_size(value:Vector2):
	plot_size = value
	update()

func _draw():
	#Draw axis
	draw_line(Vector2.ZERO, Vector2(plot_size.x, 0) , axis_line_color, axis_line_width )
	draw_line(Vector2.ZERO, Vector2(0, -plot_size.y), axis_line_color, axis_line_width )
	
	#Draw grid
	var grid_step_x := plot_size.x / grid_divisions.x
	var grid_step_y := plot_size.y / grid_divisions.y
	for i in int(grid_divisions.x):
		draw_line(Vector2((i+1) * grid_step_x,0), Vector2((i+1) * grid_step_x, -plot_size.y), grid_color, grid_width )
		
	for i in int(grid_divisions.y):
		draw_line(Vector2(0, -(i+1) * grid_step_y), Vector2(plot_size.x , -(i+1) * grid_step_y) , grid_color, grid_width )
		
	for x in data_array.size() - 1:
		draw_line(Vector2(x, -data_array[x]) , Vector2(x+1, -data_array[x+1]), plot_line_color, plot_line_width )
