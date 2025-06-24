class_name Entity
extends Area2D

@export var MOVE_SPEED := 5.0
var velocity := Vector2.ZERO

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func move(direction: Vector2) -> void:
	velocity = direction * MOVE_SPEED
	global_position += velocity

func load_ability(name: String) -> Node2D:
	var ability := load("res://Abilities/" + name + '/' + name + ".tscn")
	var ability_instance = ability.instantiate()
	add_child(ability_instance)
	return ability_instance
