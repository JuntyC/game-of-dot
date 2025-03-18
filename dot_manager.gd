extends Node

#Dot Manager

var dots = []
var dot_id: String
var grid_pos: Vector2
var dot_size = 1

func create_dot():
	dot_id = IdManager.get_id()
	grid_pos = CollisionManager.new_pos()
	var new_dot = Dot.new(dot_id, grid_pos, dot_size)
	MainGrid.grid[grid_pos.x][grid_pos.y] = new_dot
	dots.append(new_dot)

func collision(neighbors: Array, dot: Dot):
	var self_destroyed = false
	var destroyed_neighbors = []
	var merged_neighbors = []
	for nei in neighbors:
		if dot.size < nei.size: 
			self_destroyed = true
		elif nei.size < dot.size and nei not in destroyed_neighbors:
			destroyed_neighbors.append(nei)
		elif nei.size == dot.size and nei not in merged_neighbors:
			merged_neighbors.append(nei)
	if self_destroyed:
		destroy_dot(dot)
		return
	for nei in destroyed_neighbors:
		destroy_dot(nei)
	for nei in merged_neighbors:
		merge_dots(dot, nei)

func destroy_dot(dot: Dot):
	MainGrid.vacate_cell(dot.positions)
	IdManager.uuid_pool.append(dot.id)
	dots.erase(dot)
	dot = null

func merge_dots(dot: Dot, nei: Dot):
	var nei_positions = nei.positions
	dot.positions.append_array(nei_positions)
	dot.size = dot.positions.size()
	destroy_dot(nei)
	MainGrid.occupy_cell(dot.positions, dot)
