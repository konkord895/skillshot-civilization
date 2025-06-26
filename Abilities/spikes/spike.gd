extends Area2D

@onready var warning_particles: GPUParticles2D = $WarningParticles
@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
	warning_particles.emitting = true
	await warning_particles.finished
	sprite_2d.visible = true
	monitoring = true
	


func _delete() -> void:
	queue_free()
