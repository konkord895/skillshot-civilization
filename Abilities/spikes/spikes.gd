extends Ability

@export var amount := 3
const SPIKE_CURSOR = preload("res://Abilities/spikes/spike-cursor.tscn")
const SPIKE = preload("res://Abilities/spikes/spike.tscn")
var cur_cursor_pos := Vector2.ZERO
var cursor_speed := 20.0
var executing := false
var cursor : Sprite2D
@onready var ability_duration: Timer = $AbilityDuration
@onready var spawn_interval: Timer = $SpawnInterval

func _ready() -> void:
	spawn_interval.wait_time = ability_duration.wait_time / amount

func _execute(target: Vector2) -> void:
	print($Cooldown.time_left)
	if not executing: # Create a cursor
		cursor = SPIKE_CURSOR.instantiate()
		cur_cursor_pos = target
		cursor.global_position = cur_cursor_pos
		executing = true
		
	else:
		cur_cursor_pos = cur_cursor_pos.move_toward(target, cursor_speed) # Make it move slowly towards the mouse
		cursor.global_position = cur_cursor_pos


func _on_ability_duration_timeout() -> void:
	executing = false
	spawn_interval.stop()

func _on_spawn_interval_timeout() -> void: # Spawn spikes at equal intervals
	var spike = SPIKE.instantiate()
	spike.global_position = cur_cursor_pos
	Projectiles.add_child(spike)
