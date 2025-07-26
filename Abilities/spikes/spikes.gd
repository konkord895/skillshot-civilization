extends Ability

@export var amount := 3
const SPIKE = preload("res://abilities/spikes/spike.tscn")
const SPIKE_TEXTURE = preload("res://abilities/spikes/spikes.png")
var curve := Curve2D.new()
var ghosts : Array[Sprite2D] = []


func _ready() -> void:
	await get_tree().physics_frame
	user.got_stunned.connect(clear)


func _execute(target: Vector2, state: State) -> void:
	if state == State.PRESSED:
		executing = true
		curve.add_point(target)

	elif state == State.HELD and executing:
		if target != curve.get_point_position(curve.point_count - 1): # To not add points at the same position
			curve.add_point(target)
		var curve_length := curve.get_baked_length()
		if curve_length >= 32*len(ghosts) and len(ghosts) < amount: # Add a ghost 
			var ghost = Sprite2D.new()
			ghost.texture = SPIKE_TEXTURE
			ghost.modulate = Color(0.671, 1.0, 0.616, 0.635)
			Game.battle_region.add_child(ghost)
			ghosts.append(ghost)

		for i in range(amount): # Set the ghosts' positions
			if i > len(ghosts)-1: # If there is less ghosts then the final amount
				break
			var ghosts_amount = clamp(len(ghosts) - 1, 1, amount) # So that it doesn't divide by zero
			var offset = curve_length/(ghosts_amount) * i
			ghosts[i].global_position = curve.sample_baked(offset) + Vector2(0.0, -14.0)

	elif state == State.RELEASED and executing: # Spawn spikes
		for ghost in ghosts:
			spawn_spike(ghost.global_position)
		clear()
		cooldown.start()


func clear() -> void:
	for ghost in ghosts:
		ghost.queue_free()
	ghosts.clear()
	curve.clear_points()
	executing = false


func spawn_spike(coords: Vector2) -> void:
	var spike = SPIKE.instantiate()
	spike.global_position = coords
	spike.user = user
	Game.battle_region.add_child(spike)
