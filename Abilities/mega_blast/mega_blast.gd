extends Node2D
const MEGABLAST = preload("res://Abilities/mega_blast/mega_blast_projectile.tscn")
@onready var act: Timer = $Act
@onready var delet: Timer = $Delet

func _execute(target: Vector2):
	act.start()
	if act.time_left == 0:
		var mb_i = MEGABLAST.instantiate()
		mb_i.direction = global_position.direction_to(target)
		mb_i.global_position = global_position
		Projectiles.add_child(mb_i)
		delet.start()
		if delet.time_left == 0:
			Projectiles.remove_child(mb_i)
			
		
	
