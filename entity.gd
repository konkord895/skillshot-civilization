class_name Entity
extends Area2D

@export var MOVE_SPEED := 200.0
var velocity := Vector2.ZERO
var stunned := false
@onready var sprite: Sprite2D = $Sprite

func move(direction: Vector2, delta: float) -> void:
	velocity = direction * MOVE_SPEED * delta
	global_position += velocity

func load_ability(ability_name: String) -> Node2D:
	var ability := load("res://abilities/" + ability_name + '/' + ability_name + ".tscn")
	var ability_instance = ability.instantiate()
	add_child(ability_instance)
	ability_instance.user = self
	return ability_instance

func get_stunned(duration: float) -> void:
	if not stunned:
		stunned = true
		await get_tree().create_timer(duration).timeout
		stunned = false
