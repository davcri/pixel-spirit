extends Node


var inertia = 0.0
var prev_pos = null
var vel = Vector2()
var max_inertia = 1.0

func _process(delta):
	if prev_pos == null:
		prev_pos = get_viewport().get_mouse_position()
		return

	var delta_pos: float =  get_viewport().get_mouse_position().distance_squared_to(prev_pos)
	var delta_velocity = delta_pos / delta
	inertia += delta_velocity * 0.01
	inertia = clamp(inertia, 0.0, max_inertia)
	inertia = lerp(inertia, 0.0, delta * 3.)
	prev_pos = get_viewport().get_mouse_position()
