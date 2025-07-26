extends Enemy

@onready var ability = load_ability("bopl_tower")


func _on_timerforattack_timeout() -> void:
	ability.execute(global_position, Ability.State.PRESSED)
