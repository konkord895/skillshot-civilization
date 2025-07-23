class_name Entity
extends Area2D

@export var MOVE_SPEED := 200.0
var velocity := Vector2.ZERO
var stunned := false
var speed_mul := 1.0
@onready var effects: Effects = $Effects
@onready var sprite: Sprite2D = $Sprite

func move(direction: Vector2, delta: float) -> void:
	speed_mul = 1.0
	for effect in effects.get_children():
		speed_mul *= effect.mul
	velocity = direction * MOVE_SPEED * speed_mul * delta
	global_position += velocity
	

func load_ability(ability_name: String) -> Node2D:
	var ability := load("res://abilities/" + ability_name + '/' + ability_name + ".tscn")
	var ability_instance = ability.instantiate()
	add_child(ability_instance)
	ability_instance.user = self
	return ability_instance

func take_damage() -> void:
	print(name + " got hit")

func get_stunned(duration: float) -> void:
	if not stunned:
		stunned = true
		await get_tree().create_timer(duration).timeout
		stunned = false

func get_slowed(duration: float, new_mul) -> void:
	speed_mul = min(speed_mul, new_mul)
	await get_tree().create_timer(duration).timeout
	if speed_mul == new_mul:
		speed_mul = 1.0
