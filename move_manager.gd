extends Node

#Movement Manager

func new_vector(positions, target_vector) -> Dictionary:
	var new_direction = Global.directions[randi() % Global.directions.size()]
	var new_steps = randi() % Global.max_steps + 1
	var new_positions = []
	for pos in positions:
		var new_pos = pos + (new_direction * new_steps)
		new_positions.append(new_pos)
	for new_pos in new_positions:
		if not CollisionManager.within_edge(new_pos):
			return new_vector(positions, target_vector)
	target_vector["direction"] = new_direction
	target_vector["steps"] = new_steps
	return target_vector

func move(target_vector, positions):
	var new_positions = []
	for pos in positions:
		var new_pos = pos + target_vector["direction"]
		new_positions.append(new_pos)
	return new_positions
