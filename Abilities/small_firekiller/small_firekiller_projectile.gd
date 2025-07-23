extends Area2D

@export var speed := 250.0
var direction: Vector2
var flying := false
var user: Entity
var target: Vector2
@onready var nav_obst: NavigationObstacle2D = $NavigationObstacle2D
@onready var remote: RemoteTransform2D = $RemoteTransform2D


func _ready() -> void:
	rotation = direction.angle()
	remove_child(nav_obst)
	Game.battle_region.add_child(nav_obst)
	remote.remote_path = nav_obst.get_path()


func _process(delta: float) -> void:
	if flying:
		global_position += delta * speed * direction
	else:
		global_position = user.global_position


func _on_area_entered(area: Area2D) -> void:
	if area is Entity and area != user:
		area.take_damage()


func _on_delete_timeout() -> void:
	queue_free()
	nav_obst.queue_free()
