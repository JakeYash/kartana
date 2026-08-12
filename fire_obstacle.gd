extends Area2D

signal minus_one_hit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(Global.cell_size/2,Global.cell_size/2) 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(body: Area2D) -> void:
	if (body is Player):
		minus_one_hit.emit()
		
	hide()
	$CollisionShape2D.set_deferred("disabled", true)
