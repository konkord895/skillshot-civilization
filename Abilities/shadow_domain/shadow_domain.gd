extends Ability

@export var radius := 96.0 ## Radius in pixels
const SHADOW_DOMAIN = preload("res://Abilities/shadow_domain/shadow_domain.png")
var size: float
@onready var ability_duration: Timer = $AbilityDuration
@onready var user: Area2D = $".//"

func _ready():
	size = radius / 96

func _execute(target: Vector2, state: State):
	if ability_duration.time_left == 0: # Spawn a texture
		target = user.global_position
		ability_duration.start()
		var domain = Sprite2D.new()
		domain.texture = SHADOW_DOMAIN
		domain.global_position = target
		domain.scale = Vector2.ZERO
		Projectiles.add_child(domain)
		var tween = create_tween()
		tween.tween_property(domain, "scale", Vector2(size, size), 0.25)
	else: # Teleport
		user.monitorable = false
		user.global_position
		
