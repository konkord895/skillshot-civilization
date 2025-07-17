extends Entity

const PLAYER = preload("res://player.tscn")

var player : Entity
var direction : Vector2
var new_direction = Vector2(0,1)
var rng = RandomNumberGenerator.new()


func _ready() -> void:
	player = get_tree().get_first_node_in_group('player')

func _physics_process(delta: float) -> void:
	move(direction, delta)
	

func _on_tictime_timeout() -> void:
	var player_dist = player.global_position - global_position
	
	#не идет к игроку при таком растоянии
	if player_dist.length() <= 200:
		new_direction = player_dist.normalized()
	
	#сближается и все еще видит его
	elif player_dist.length() <= 400:
		direction = player_dist.normalized()
	
