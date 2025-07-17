extends Area2D

@export var speed := 250.0
@export var rotation_speed := 0.5
var direction: Vector2
var flying := false
var user: Entity
var target: Vector2

func _ready() -> void:
	rotation = direction.angle()
	


func _process(delta: float) -> void:
	if flying:
		global_position += delta * speed * direction
	else:
		global_position = user.global_position
