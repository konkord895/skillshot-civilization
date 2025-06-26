extends Area2D

<<<<<<< Updated upstream
var speed := 40.0
var end_speed := 700
var direction := Vector2.ZERO

func _ready() -> void:
	rotation = direction.angle()
	var tween = create_tween()
	tween.tween_property(self, "speed", end_speed, 1).set_ease(Tween.EASE_IN)

=======
var speed : float = 55
var direction : Vector2 = Vector2.ZERO
>>>>>>> Stashed changes

func _process(delta):
	global_position += delta * speed * direction
