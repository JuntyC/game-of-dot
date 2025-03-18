class_name Dot

var id: String
var positions = []
var size: int
var target_vector = {"direction": Vector2.ZERO, "steps": 0}
var move_timer = 0.0

func _init(dot_id: String, dot_pos: Vector2, dot_size: int):
	id = dot_id
	positions.append(dot_pos)
	size = dot_size
	target_vector = MoveManager.new_vector(positions, target_vector)

func _process(delta: float):
	move_timer += delta
	if move_timer >= Global.tick:
		move_tick()

func move_tick():
	move_timer = 0.0
	var old_pos = positions.duplicate()
	positions = MoveManager.move(target_vector, positions)
	MainGrid.vacate_cell(old_pos)
	MainGrid.occupy_cell(positions, self)
	collision_check()
	target_vector["steps"] -= 1
	if target_vector["steps"] <= 0:
		target_vector = MoveManager.new_vector(positions, target_vector)

func collision_check():
	for pos in positions:
		var neighbors = CollisionManager.return_neighbor(pos, self)
		if not neighbors.is_empty():
			DotManager.collision(neighbors, self)
