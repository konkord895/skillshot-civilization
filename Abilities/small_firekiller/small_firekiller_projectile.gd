extends Projectile

@export var speed := 250.0
var direction: Vector2
var flying := false
var target: Vector2


func _ready() -> void:
	rotation = direction.angle()


func _process(delta: float) -> void:
	if flying:
		global_position += delta * speed * direction
	else:
		global_position = user.global_position


func _on_area_entered(area: Area2D) -> void:
	if area is Entity and area != user:
		area.take_damage()


func _on_delete_timeout() -> void:
	delete()
