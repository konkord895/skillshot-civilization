extends Area2D

var start_node: Node2D
var end_node: Node2D
var user: Entity
@onready var lightning: Sprite2D = $Lightning

@onready var nav_obst: NavigationObstacle2D = $NavigationObstacle2D
@onready var remote: RemoteTransform2D = $RemoteTransform2D

func _ready() -> void:
	remove_child(nav_obst)
	Game.battle_region.add_child(nav_obst)
	remote.remote_path = nav_obst.get_path()

func _process(delta: float) -> void:
	var start_coords = start_node.global_position
	var end_coords = end_node.global_position 
	global_position = (start_coords + end_coords) / 2
	look_at(start_coords)
	var length = start_coords.distance_to(end_coords) / lightning.texture.get_width()
	scale.x = length
	lightning.material.set_shader_parameter("amplitude", Vector2(length, 1.0))


func _on_area_entered(area: Area2D) -> void:
	if area is Entity and area != user:
		area.take_damage()
