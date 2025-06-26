extends Ability

const SPIKE = preload("res://Abilities/spikes/spike_projectile.tscn")


func _execute(target: Vector2) -> void:
	var spike_inst = SPIKE.instantiate()
	spike_inst.global_position = target
	get_node("/root/Projectiles").add_child(spike_inst)
	pass
