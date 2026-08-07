class_name Player
extends Area2D

var screen_size
var cell_size


func move_direction(velocity: Vector2) -> void:
	if (velocity.x == 1):
		if (position.x < (screen_size.x * 5.0/6.0)):
			position.x += (cell_size)
	if (velocity.x == -1):
		if (position.x > (screen_size.x * 1.0/6.0)):
			position.x -= (cell_size)
	if (velocity.y == 1):
		if (position.y < (screen_size.y * 5.0/6.0)):
			position.y += (cell_size)
	if (velocity.y == -1):
		if (position.y > (screen_size.y * 1.0/6.0)):
			position.y -= (cell_size)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	var halfway_point = screen_size/2.0
	cell_size = screen_size.x / 3.0 # x and y will always be = so irrelevant which one
	position = halfway_point


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var velocity = Vector2.ZERO
	if Input.is_action_just_pressed("move_right"): # just pressed makes it so holding doesnt work (better game feel)
		velocity.x += 1
	if Input.is_action_just_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_just_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_just_pressed("move_up"):
		velocity.y -= 1
		
	if (velocity.length() > 0):
		move_direction(velocity)
		
	
