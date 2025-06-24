class_name Ability
extends Node2D

@onready var cooldown: Timer = $Cooldown

func execute(target: Vector2) -> void:
	if cooldown.time_left == 0:
		_execute(target)
		cooldown.start()

func _execute(target: Vector2) -> void:
	pass
