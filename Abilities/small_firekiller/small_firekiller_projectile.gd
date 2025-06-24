extends Area2D

var speed := 80.0
var end_speed := 400
var direction := Vector2.ZERO

func _ready() -> void:
	rotation = direction.angle()
	var tween = create_tween()
	tween.tween_property(self, "speed", end_speed, 0.5).set_ease(Tween.EASE_IN)


func _process(delta):
	global_position += delta * speed * direction
