extends Ability

@export var rotation_speed := 20.0
const FIREKILLER = preload("res://abilities/small_firekiller/small_firekiller_projectile.tscn")
var fire_inst: Area2D
@onready var ability_duration: Timer = $AbilityDuration

func _execute(target: Vector2, state: State):
	if state == State.PRESSED and not executing: # Spawn projectile
		executing = true
		ability_duration.start()
		user.effects.apply("firekiller", 0.7, true)
		fire_inst = FIREKILLER.instantiate()
		var to_target = global_position.direction_to(target)
		if to_target:
			fire_inst.direction = to_target
		else:
			fire_inst.direction = Vector2.RIGHT
		fire_inst.global_position = global_position
		fire_inst.user = user
		Projectiles.add_child(fire_inst)
		ability_duration.start()
		
	elif state == State.HELD and executing: # Rotate toward target
		var direction_to_target := global_position.direction_to(target)
		var target_angle := direction_to_target.angle()
		var angle = lerp_angle(fire_inst.rotation, target_angle, 0.15)
		fire_inst.rotation = angle
		fire_inst.direction = Vector2.RIGHT.rotated(angle)
		
	elif state == State.RELEASED and executing:
		shoot()
		ability_duration.stop()

func shoot() -> void:
	user.effects.remove("firekiller")
	executing = false
	fire_inst.flying = true
	fire_inst.monitoring = true
	cooldown.start()
	user.speed_mul = 1.0
