extends Node2D
const FIREKILLER = preload("res://Abilities/small_firekiller/small_firekiller_projectile.tscn")

func execute(target: Vector2):
	var fkscene = FIREKILLER.instantiate()
	fkscene.direction = global_position.direction_to(target)
	fkscene.global_position = global_position
	get_node("/root").add_child(fkscene)
	
	
