extends Node

var grid_size = 120
var cell_size = 4
var wall_size = 1
var full_cell_size = cell_size + wall_size
var grid_offset = 10
var directions = [Vector2(-1,0),Vector2(1,0),Vector2(0,-1),Vector2(0,1)]
var tick = 0.02
var max_steps = 20
