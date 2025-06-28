extends Ability
const MEGABLAST = preload("res://Abilities/megablast/megablast_projectile.tscn")

func _execute(target: Vector2):
	var mb_i = MEGABLAST.instantiate()
	mb_i.direction = global_position.direction_to(target)
	mb_i.global_position = global_position
	
	get_node("/root/Projectiles").add_child(mb_i)
	



func _on_destoy_timeout() -> void:
	var mb_i = MEGABLAST.instantiate()
	mb_i.queue_free()
	pass # Replace with function body.
