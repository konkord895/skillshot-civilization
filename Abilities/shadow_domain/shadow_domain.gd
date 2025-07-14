extends Ability

@export var radius := 96.0 ## Radius in pixels
@export var teleport_time := 0.3
const SHADOW_DOMAIN = preload("res://abilities/shadow_domain/shadow_domain.png")
const MELT = preload("res://melt.gdshader")
var domain: Sprite2D
@onready var size := radius / 48
@onready var ability_duration: Timer = $AbilityDuration

@onready var tp_cooldown: Timer = $TeleportCooldown



func _execute(target: Vector2, state: State):
	if state != State.PRESSED:
		return
		
	if ability_duration.time_left == 0: # Spawn a texture

		ability_duration.start()
		domain = Sprite2D.new()
		domain.texture = SHADOW_DOMAIN
		domain.global_position = target
		domain.scale = Vector2.ZERO
		Projectiles.add_child(domain)
		var tween = create_tween()
		tween.tween_property(domain, "scale", Vector2(size, size), 0.25)

	#else: # Teleport
		#user.monitorable = false
		#user.global_position = target
		


	elif global_position.distance_to(domain.global_position) <= radius and tp_cooldown.time_left == 0: # Teleport
		tp_cooldown.start()
		#region Animation
		var shadow = Sprite2D.new()
		shadow.texture = user.sprite.texture
		var s_material = ShaderMaterial.new()
		s_material.shader = MELT
		shadow.material = s_material
		Projectiles.add_child(shadow)
		shadow.global_position = global_position
		var tween = create_tween()
		tween.set_parallel(true)
		tween.tween_method(func(value): shadow.material.set_shader_parameter("progress", value), 0.0, 1.0, 1.0)
		tween.tween_method(func(value): shadow.material.set_shader_parameter("mix_value", value), 0.0, 1.0, 0.2)

		user.sprite.material.shader = MELT
		tween.tween_method(func(value): user.sprite.material.set_shader_parameter("progress", value), 1.0, 0.0, teleport_time)
		tween.tween_method(func(value): user.sprite.material.set_shader_parameter("mix_value", value), 1.0, 0.0, teleport_time + 0.4)
		user.get_stunned(teleport_time)
		#endregion

		var offset: Vector2
		offset = domain.to_local(target).limit_length(radius*0.9)
		user.global_position = domain.global_position + offset

func _on_ability_duration_timeout() -> void:
	cooldown.start()
	var tween = create_tween()
	tween.tween_property(domain, "scale", Vector2(0.0, 0.0), 0.25)
	await tween.finished
	domain.queue_free()
