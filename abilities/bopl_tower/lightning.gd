extends Area2D

var start_node: Node2D
var end_node: Node2D
@onready var lightning: Sprite2D = $Lightning


func _process(delta: float) -> void:
	var start_coords = start_node.global_position
	var end_coords = end_node.global_position 
	global_position = (start_coords + end_coords) / 2
	look_at(end_coords)
	var length = start_coords.distance_to(end_coords) / lightning.texture.get_width()
	scale.x = length
	lightning.material.set_shader_parameter("amplitude", Vector2(length, 1.0))
