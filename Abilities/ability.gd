class_name Ability
extends Node2D

@onready var cooldown: Timer = $Cooldown

enum State{
	PRESSED,
	HELD,
	RELEASED,
}

func execute(target: Vector2, state: State) -> void:
	if cooldown.time_left == 0:
		_execute(target, state)

func _execute(target: Vector2, state: State) -> void:
	pass
