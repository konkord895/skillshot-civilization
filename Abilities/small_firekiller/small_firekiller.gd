extends Ability
const FIREKILLER = preload("res://abilities/small_firekiller/small_firekiller_projectile.tscn")

func _execute(target: Vector2, state: State):
	var fire_inst = FIREKILLER.instantiate()
	var to_target = global_position.direction_to(target)
	if to_target:
		fire_inst.direction = to_target
	else:
		fire_inst.direction = Vector2.RIGHT
	fire_inst.global_position = global_position
	Projectiles.add_child(fire_inst)
	cooldown.start()
	
