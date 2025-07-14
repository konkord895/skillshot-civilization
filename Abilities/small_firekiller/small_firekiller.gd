extends Ability
const FIREKILLER = preload("res://abilities/small_firekiller/small_firekiller_projectile.tscn")
@onready var ability_duration: Timer = $AbilityDuration
var fire_inst: Area2D


func _execute(target: Vector2, state: State):
	if state == State.PRESSED and ability_duration.time_left == 0: # Spawn projectile
		ability_duration.start()
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
	elif state == State.HELD:
		fire_inst.global_position
	
