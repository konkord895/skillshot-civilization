extends Area2D

var user: Entity
@onready var warning_particles: GPUParticles2D = $WarningParticles
@onready var sprite: Sprite2D = $Sprite2D
@onready var delete_timer: Timer = $DeleteTimer
@onready var activation_timer: Timer = $ActivationTimer
@onready var nav_obst: NavigationObstacle2D = $NavigationObstacle2D
@onready var remote: RemoteTransform2D = $RemoteTransform2D

func _ready() -> void:
	warning_particles.emitting = true
	activation_timer.start()
	await activation_timer.timeout
	warning_particles.emitting = false
	sprite.visible = true
	monitoring = true
	
	delete_timer.start()
	
	remove_child(nav_obst)
	Game.battle_region.add_child(nav_obst)
	remote.remote_path = nav_obst.get_path()
	


func _delete() -> void:
	queue_free()
	nav_obst.queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area is Entity and area != user:
		area.take_damage()
