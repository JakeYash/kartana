class_name Player
extends Area2D

var grid_pos

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.window_size_changed.connect(update_position)
	
	grid_pos = Vector2i(1,1)
	update_position()

func update_position() -> void:
	position.x = Global.halfway_point.x + (grid_pos.x - 1) * Global.cell_size
	position.y = Global.halfway_point.y + (grid_pos.y - 1) * Global.cell_size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var velocity = Vector2i.ZERO
	if Input.is_action_just_pressed("move_right"): # just pressed makes it so holding doesnt work (better game feel)
		velocity.x += 1
	if Input.is_action_just_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_just_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_just_pressed("move_up"):
		velocity.y -= 1
	
	grid_pos += velocity
	grid_pos.x = clampi(grid_pos.x, 0, 2)
	grid_pos.y = clampi(grid_pos.y, 0, 2)
	update_position()
	
	
	


func _on_fire_obstacle_minus_one_hit() -> void:
	print("hit!")
