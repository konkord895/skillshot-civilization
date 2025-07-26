extends Enemy


@onready var ability1 = load_ability("small_firekiller")
@onready var timertoheld: Timer = $Timertoheld
@onready var timertoattack: Timer = $Timertoattack


func _process(delta: float) -> void:
	player_pos = get_tree().get_first_node_in_group("player").global_position
	ability1.execute(player_pos, Ability.State.HELD)



func _on_timertoattack_timeout() -> void:
	ability1.execute(player_pos, Ability.State.PRESSED)
