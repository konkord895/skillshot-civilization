extends Ability

@export var fly_time := 2.0
const BOMB = preload("res://abilities/poison_bomb/bomb.tscn")
const POISON = preload("res://abilities/poison_bomb/poison.tscn")
var poison : Area2D
@onready var ability_duration: Timer = $AbilityDuration

func _ready() -> void:
	ability_duration.wait_time += fly_time

func _execute(target: Vector2, state: State) -> void:
	if state != State.PRESSED or ability_duration.time_left != 0:
		return
	ability_duration.start()
	var bomb = BOMB.instantiate()
	bomb.global_position = global_position
	bomb.target = target
	bomb.fly_time = fly_time
	Projectiles.add_child(bomb)
	await get_tree().create_timer(fly_time).timeout
	poison = POISON.instantiate()
	poison.global_position = target
	Projectiles.add_child(poison)


func _on_ability_duration_timeout() -> void:
	poison.queue_free()
	cooldown.start()
