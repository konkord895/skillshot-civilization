extends Node2D

var fly_time: float
var target: Vector2
var speed: float
@onready var sprite: Sprite2D = $Sprite


func _ready() -> void:
	speed = global_position.distance_to(target) / fly_time
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_QUAD)
	tween.tween_property(sprite, "position:y", -50.0, fly_time / 2).set_ease(Tween.EASE_OUT)
	tween.tween_property(sprite, "position:y", 0.0, fly_time / 2).set_ease(Tween.EASE_IN)
	await tween.finished
	queue_free()


func _process(delta: float) -> void:
	global_position = global_position.move_toward(target, speed * delta)
