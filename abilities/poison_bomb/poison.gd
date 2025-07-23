extends Area2D
@onready var nav_obst: NavigationObstacle2D = $NavigationObstacle2D
@onready var remote: RemoteTransform2D = $RemoteTransform2D


var entities_inside = []

func _ready() -> void:
	remove_child(nav_obst)
	Game.battle_region.add_child(nav_obst)
	remote.remote_path = nav_obst.get_path()
	

func _process(delta: float) -> void:
	for entity in entities_inside:
		pass # Poison


func _on_area_entered(area: Area2D) -> void:
	entities_inside.append(area)

func _on_area_exited(area: Area2D) -> void:
	entities_inside.erase(area)
