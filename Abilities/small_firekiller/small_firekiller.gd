extends Node2D
const FIREKILLER = preload("res://Abilities/small_firekiller/small_firekiller_projectile.tscn")

func execute(target: Vector2):
	var fkscene = FIREKILLER.instantiate()
	fkscene.direction = global_position.direction_to(target)
	add_sibling(fkscene)
	
	
