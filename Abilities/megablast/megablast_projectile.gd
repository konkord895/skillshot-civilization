extends Projectile

var direction := Vector2.ZERO
@onready var delete_timer: Timer = $Delete


func _ready() -> void:
	rotation = direction.angle()
	delete_timer.start()


func _on_area_entered(area: Area2D) -> void:
	if area is Entity and area != user:
		area.take_damage()


func _on_delete_timeout() -> void:
	delete()
