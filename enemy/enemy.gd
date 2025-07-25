extends Entity


var target: Vector2
var rng := RandomNumberGenerator.new()

@onready var ability1 = load_ability("small_firekiller")
@onready var nav_agent: NavigationAgent2D = $NavigationAgent2D
@onready var tfa: Timer = $TimerForAttack

func _ready() -> void:
	nav_agent.avoidance_enabled = true
	await get_tree().physics_frame
	target = global_position + get_random()

func _process(delta: float) -> void:
	
	var player_pos = get_tree().get_first_node_in_group("player").global_position	
	
	ability1.execute(player_pos, Ability.State.HELD)
	

func _physics_process(delta: float) -> void:

	#if NavigdwationServer2D.map_get_iteration_id(Game.map):
		#target = NavigationServer2D.map_get_closest_point(Game.map, global_position)
	#if not Geometry2D.is_point_in_polygon(global_position, Game.battle_map.navigation_polygon.get_vertices()):
	if nav_agent.is_navigation_finished():
		target = global_position + get_random()

	if target:
		nav_agent.target_position = target
	if nav_agent.is_navigation_finished():
		return
	var direction = global_position.direction_to(nav_agent.get_next_path_position())
	move(direction, delta)
	

func get_random() -> Vector2:
	return Vector2(rng.randf_range(50.0, 200.0), 0.0).rotated(deg_to_rad(rng.randf_range(0.0, 360.0)))
