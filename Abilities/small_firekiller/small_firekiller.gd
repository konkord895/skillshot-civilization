extends Ability
const FIREKILLER = preload("res://Abilities/small_firekiller/small_firekiller_projectile.tscn")

func _execute(target: Vector2):
	var fire_inst = FIREKILLER.instantiate()
	fire_inst.direction = global_position.direction_to(target)
	fire_inst.global_position = global_position
	Projectiles.add_child(fire_inst)
	
	
