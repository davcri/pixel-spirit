extends Node2D


func _ready():
	var current_screen = DisplayServer.window_get_current_screen()
	var current_window_id = get_window().get_window_id()
	var screen_usable_rect = DisplayServer.screen_get_usable_rect(current_screen)
	var target_size = DisplayServer.screen_get_size(current_screen)

	# shrink
	target_size = target_size * 0.5

	DisplayServer.window_set_size(target_size, current_window_id)
	DisplayServer.window_set_position(Vector2(screen_usable_rect.position.x + screen_usable_rect.size.x /2 - target_size.x/2, 0), current_window_id)
