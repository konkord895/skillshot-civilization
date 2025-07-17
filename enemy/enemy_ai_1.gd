extends Entity

const PLAYER = preload("res://player.tscn")
var player = PLAYER.instantiate()

var direction : Vector2
var new_direction = Vector2(0,1)
var rng = RandomNumberGenerator.new()
var tictimer = 0


func _physics_process(delta: float) -> void:
	move(direction, delta)
	

func _on_tictime_timeout() -> void:
	var player_dist = player.global_position - self.global_position
	
	#не идет к игроку при таком растоянии
	if player_dist.length() <= 20:
		new_direction = player_dist.normalized()
	
	#сближается и все еще видит его
	elif player_dist.length() <= 50 and tictimer == 0:
		direction = player_dist.normalized()
	
	#забыл игрока
	elif tictimer == 0:
		var random_direction = rng.randf()
		
		if random_direction < 0.5:
			direction = Vector2.ZERO
		else:
			direction = Vector2.DOWN.rotated(rng.randf() * 2 * PI)
