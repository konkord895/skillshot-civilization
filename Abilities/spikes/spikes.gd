extends Ability

@export var amount := 3
@export var ability_duration := 10.0
@export var cursor_speed := 3.0
const SPIKE_CURSOR = preload("res://Abilities/spikes/spike-cursor.tscn")
const SPIKE = preload("res://Abilities/spikes/spike.tscn")
var cursor : Sprite2D
@onready var ability_duration_timer: Timer = $AbilityDuration
@onready var spawn_interval_timer: Timer = $SpawnInterval


func _ready() -> void:
	ability_duration_timer.wait_time = ability_duration
	spawn_interval_timer.wait_time = ability_duration_timer.wait_time / amount


func _execute(target: Vector2) -> void:
	if ability_duration_timer.time_left == 0: # Create a cursor
		cursor = SPIKE_CURSOR.instantiate()
		cursor.global_position = target
		Projectiles.add_child(cursor)
		ability_duration_timer.start()
		spawn_interval_timer.start()
		_spawn_spike()

	else: # Make it move slowly towards the mouse
		cursor.global_position = cursor.global_position.move_toward(target, cursor_speed) 


func _on_ability_duration_timeout() -> void:
	cooldown.start()
	cursor.queue_free()
	spawn_interval_timer.stop()


func _spawn_spike() -> void: # Spawn spikes at equal intervals
	var spike = SPIKE.instantiate()
	spike.global_position = cursor.global_position
	Projectiles.add_child(spike)
