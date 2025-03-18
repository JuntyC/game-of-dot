extends Node

#Collision Manager

func new_pos():
	var rand_pos = Vector2(randi() % Global.grid_size, randi() % Global.grid_size)
	if return_neighbor(rand_pos, null).is_empty() and MainGrid.grid[rand_pos.x][rand_pos.y] == null and within_edge(rand_pos):
		return rand_pos
	else:
		return new_pos()

func return_neighbor(pos: Vector2, dot: Dot = null):
	var neighbor_dots = []
	for dir in Global.directions:
		var pos_adj = pos + dir
		if within_edge(pos_adj):
			var grid_cell = MainGrid.grid[pos_adj.x][pos_adj.y]
			if grid_cell != null and grid_cell != dot and grid_cell not in neighbor_dots:
				neighbor_dots.append(grid_cell)
	return neighbor_dots

func within_edge(i):
	if (i.x >= 0 and 
		i.x < Global.grid_size and 
		i.y >= 0 and 
		i.y < Global.grid_size): 
		return true
	else:
		return false
