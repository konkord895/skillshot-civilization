extends Ability

const MEGABLAST = preload("res://abilities/megablast/megablast_projectile.tscn")
@onready var ability_duration: Timer = $AbilityDuration


func _execute(target: Vector2, state : State):
	user.get_stunned(ability_duration.wait_time)
	
	cooldown.start()

	var megablast = MEGABLAST.instantiate()
	megablast.monitoring = false
	megablast.direction = global_position.direction_to(target)
	megablast.global_position = global_position
	megablast.modulate = Color(1, 1, 1, 0.1)
	megablast.user = user
	Game.battle_region.add_child(megablast)
	
	ability_duration.start()
	await ability_duration.timeout
	megablast.monitoring = true
	megablast.modulate = Color(1, 1, 1, 1)
