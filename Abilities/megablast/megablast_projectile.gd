extends Area2D

var direction := Vector2.ZERO

func _ready() -> void:
	rotation = direction.angle()
