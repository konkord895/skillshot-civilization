extends Area2D

var user: Entity
@onready var delete: Timer = $Delete
@onready var nav_obst: NavigationObstacle2D = $NavigationObstacle2D
@onready var remote: RemoteTransform2D = $RemoteTransform2D

var direction := Vector2.ZERO

func _ready() -> void:
	rotation = direction.angle()
	delete.start()
	remove_child(nav_obst)
	Game.battle_region.add_child(nav_obst)
	remote.remote_path = nav_obst.get_path()


func _on_delete_timeout() -> void:
	queue_free()
	nav_obst.queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area is Entity and area != user:
		area.take_damage()
