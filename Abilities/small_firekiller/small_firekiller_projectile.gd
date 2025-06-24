extends Area2D

var speed : float = 40
var direction : Vector2 = Vector2.ZERO

func _process(delta):
	global_position += delta * speed * direction
