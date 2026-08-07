extends Area2D

signal minus_one_hit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var screen_size = get_viewport_rect().size
	var cell_size = screen_size.x / 3.0
	position = Vector2(cell_size/2,cell_size/2) 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if (body is Player):
		minus_one_hit.emit()
		
	hide()
	$CollisionShape2D.set_deferred("disabled", true)
