extends Projectile

@onready var warning_particles: GPUParticles2D = $WarningParticles
@onready var sprite: Sprite2D = $Sprite2D
@onready var delete_timer: Timer = $Delete
@onready var activation_timer: Timer = $ActivationTimer


func _ready() -> void:
	super()
	warning_particles.emitting = true
	activation_timer.start()
	await activation_timer.timeout
	warning_particles.emitting = false
	sprite.visible = true
	monitoring = true
	
	delete_timer.start()
	


func _on_area_entered(area: Area2D) -> void:
	if area is Entity and area != user:
		area.take_damage()


func _on_delete_timeout() -> void:
	delete()
