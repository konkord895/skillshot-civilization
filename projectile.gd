class_name Projectile
extends Area2D


@onready var nav_obst: NavigationObstacle2D = $NavigationObstacle2D
var user: Entity


func _ready() -> void:
	if not user.is_in_group("player"):
		nav_obst.queue_free()

func delete():
	queue_free()
