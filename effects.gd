class_name Effects
extends Node

var effects = {}


func apply(_name: String, mul: float, manual := false, duration := 0.0) -> void:
	var present := false
	var effect: Effect
	for child in get_children():
		if child.name == _name:
			effect = child
			present = true
	if not present:
		effect = Effect.new()
		effect.name = _name
		add_child(effect)
	effect.mul = mul
	effect.duration = duration
	effect.manual = manual
	

func remove(_name: String):
	get_node(_name).queue_free()
