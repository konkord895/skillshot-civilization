extends Ability

const MEGABLAST = preload("res://abilities/megablast/megablast_projectile.tscn")
@onready var act: Timer = $Act


func _execute(target: Vector2, state : State):
	user.get_stunned(act.wait_time)
	
	cooldown.start()

	var mb_i = MEGABLAST.instantiate()
	mb_i.monitoring = false
	mb_i.direction = global_position.direction_to(target)
	mb_i.global_position = global_position
	mb_i.modulate = Color(1, 1, 1, 0.1)
	mb_i.user = user
	Projectiles.add_child(mb_i)
	
	act.start()
	await act.timeout
	mb_i.monitoring = true
	mb_i.modulate = Color(1, 1, 1, 1)
	
	
