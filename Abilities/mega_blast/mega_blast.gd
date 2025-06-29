extends Node2D
const MEGABLAST = preload("res://Abilities/mega_blast/mega_blast_projectile.tscn")

func _execute(target: Vector2):
	var mb_i = MEGABLAST.instantiate()
	mb_i.direction = global_position.direction_to(target)
	mb_i.global_position = global_position
	Projectiles.add_child(mb_i)
	
