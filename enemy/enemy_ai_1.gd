extends Entity

const PLAYER = preload("res://player.tscn")

var player : Entity
var direction : Vector2
var rng = RandomNumberGenerator.new()


func _ready() -> void:
	player = get_tree().get_first_node_in_group('player')

func _physics_process(delta: float) -> void:
	move(direction, delta)
	

func _on_tictime_timeout() -> void:
	var player_dist = player.global_position - global_position
	

	
