class_name Ability
extends Node2D

@export var ICON_TEXTURE: CompressedTexture2D
var executing := false
@onready var cooldown: Timer = $Cooldown
@onready var user: Entity

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
	

	
