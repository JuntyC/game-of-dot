extends Node2D

var grid_size = Global.grid_size
var full_cell_size = Global.full_cell_size
var wall_size = Global.wall_size
var offset = Global.grid_offset

func _ready():
	queue_redraw()

func _draw():
	var start_point: Vector2
	var end_point: Vector2
	for x in range(grid_size + 1):
		start_point = Vector2((x * full_cell_size) + offset, offset)
		end_point = Vector2((x * full_cell_size) + offset, (grid_size * full_cell_size) + offset)
		draw_line(start_point, end_point, Color(0.5,0.5,0.5), wall_size)
	for y in range(grid_size + 1):
		start_point = Vector2(offset, (y * full_cell_size) + offset)
		end_point = Vector2((grid_size * full_cell_size) + offset, (y * full_cell_size) + offset)
		draw_line(start_point, end_point, Color(0.5,0.5,0.5), wall_size)
