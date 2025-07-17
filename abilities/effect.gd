class_name Effect
extends Node

var mul := 1.0
var duration := 0.0
var manual := false


func _process(delta: float) -> void:
	if not manual:
		duration -= delta
		if duration <= 0:
			queue_free()
