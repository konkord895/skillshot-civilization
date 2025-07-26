class_name Projectile
extends Area2D

@onready var nav_obst: NavigationObstacle2D = $NavigationObstacle2D
@onready var remote: RemoteTransform2D = $RemoteTransform2D

func init_nav() -> void:
	if nav_obst and remote:
		remove_child(nav_obst)
		Game.battle_region.add_child(nav_obst)
		remote.remote_path = nav_obst.get_path()
	else:
		printerr("NavigationObstacle or RemoteTransform is missing")


func delete():
	queue_free()
	if nav_obst:
		nav_obst.queue_free()
