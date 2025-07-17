extends Area2D

var user: Entity
@onready var delete: Timer = $Delete

var direction := Vector2.ZERO

func _ready() -> void:
	rotation = direction.angle()
	delete.start()


func _on_delete_timeout() -> void:
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area is Entity and area != user:
		area.take_damage()
