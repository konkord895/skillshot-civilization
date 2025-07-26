extends Ability

const HUNTER = preload("res://abilities/hunt/hunter.tscn")
var hunter: Area2D
@onready var ability_duration: Timer = $AbilityDuration

func _execute(target: Vector2, state: State):
	if state == State.PRESSED and not executing:
		executing = true
		ability_duration.start()
		hunter = HUNTER.instantiate()
		var offset = target - global_position
		hunter.global_position = global_position + offset.limit_length(50.0)
		hunter.user = user
		var challengers = get_tree().get_nodes_in_group("challenger")
		for challenger in challengers:
			if challenger != user:
				hunter.prey = challenger
		Game.battle_region.add_child(hunter)



func _on_ability_duration_timeout() -> void:
	hunter.die()
	executing = false
	cooldown.start()
