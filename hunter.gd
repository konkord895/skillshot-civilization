extends Area2D

const SPEED := 150.0
var prey: Node2D
var hunting = false
var overlapping: Area2D = null
@onready var sprite: Sprite2D = $Sprite


func _ready() -> void:
	var tween = create_tween()
	tween.tween_method(func(value): sprite.material.set_shader_parameter("progress", value), 1.0, 0.0, 0.5)
	await tween.finished
	hunting = true


func _process(delta: float) -> void:
	if hunting and global_position.distance_to(prey.global_position) > 5.0:
		global_position = global_position.move_toward(prey.global_position, SPEED * delta)
	if overlapping:
		overlapping.effects.apply("hunt", 0.5, false, 1.0) 


func die() -> void:
	var tween = create_tween()
	tween.tween_method(func(value): sprite.material.set_shader_parameter("progress", value), 0.0, 1.0, 0.5)
	await tween.finished
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area is Entity:
		overlapping = area


func _on_area_exited(area: Area2D) -> void:
	if area == overlapping:
		overlapping = null
