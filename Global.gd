extends Node

var screen_size: Vector2
var cell_size: float
var halfway_point: Vector2
signal window_size_changed

func _ready() -> void:
	# Connect the window size change signal to our custom function
	get_window().size_changed.connect(_on_window_size_changed)
	screen_size = get_viewport().get_visible_rect().size
	cell_size = screen_size.x / 3.0
	halfway_point = screen_size / 2.0
	
func _on_window_size_changed() -> void:
	screen_size = get_viewport().get_visible_rect().size
	cell_size = screen_size.x / 3.0
	halfway_point = screen_size / 2.0
	window_size_changed.emit() #signal for mobs and player to react to and update position
