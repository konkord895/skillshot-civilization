extends Area2D

var direction := Vector2.ZERO

func _ready() -> void:
	rotation = direction.angle()


func _on_delet_timeout() -> void:
	queue_free()
	pass # Replace with function body.
