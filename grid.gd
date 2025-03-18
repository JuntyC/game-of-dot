extends Node2D

var grid_size = Global.grid_size
var cell_size = Global.cell_size
var wall_size = Global.wall_size
var full_cell_size = Global.full_cell_size
var grid_offset = Global.grid_offset
var grid = []

func _ready():
	init_grid()
	queue_redraw()

func _process(delta: float):
	if Input.is_action_pressed("ui_select"):
		DotManager.create_dot()
	for dot in DotManager.dots:
		dot._process(delta)
	queue_redraw()

func _draw():
	visual_cell_update()

func visual_cell_update():
	for x in range(grid_size):
		for y in range(grid_size):
			if grid[x][y] != null:
				var rect_pos = Vector2((x * full_cell_size) + grid_offset,(y * full_cell_size) + grid_offset)
				draw_rect(Rect2(rect_pos, Vector2(cell_size, cell_size)), Color(0,0,0))

func init_grid():
	for x in range(grid_size):
		var row = []
		for y in range(grid_size):
			row.append(null)
		grid.append(row)

func occupy_cell(positions, dot):
	for pos in positions:
		grid[pos.x][pos.y] = dot

func vacate_cell(positions):
	for pos in positions:
		grid[pos.x][pos.y] = null
