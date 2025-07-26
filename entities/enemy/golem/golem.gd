extends Enemy

var spawn_radius : Vector2
@onready var ability = load_ability("spikes")

func _on_timerforattack_timeout() -> void:
	spawn_radius = player_pos + get_random()
	ability.execute(spawn_radius, Ability.State.PRESSED)
	for i in range(3):
		spawn_radius = player_pos + get_random() + Vector2(32,0)
		ability.execute(spawn_radius, Ability.State.HELD)
	ability.execute(spawn_radius, Ability.State.RELEASED)
	

func get_random() -> Vector2:
	return Vector2(rng.randf_range(0.0, 140.0), 0.0).rotated(deg_to_rad(rng.randf_range(0.0, 360.0)))
