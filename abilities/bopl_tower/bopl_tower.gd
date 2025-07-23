extends Ability

const TOWER = preload("res://abilities/bopl_tower/tower.png")
const LIGHTNING = preload("res://abilities/bopl_tower/lightning.tscn")
var tower: Sprite2D
var lightning: Area2D
@onready var ability_duration: Timer = $AbilityDuration


func _execute(target: Vector2, state: State) -> void:
	if state == State.PRESSED and not executing:
		executing = true
		ability_duration.start()
		tower = Sprite2D.new()
		tower.texture = TOWER
		tower.global_position = global_position
		Projectiles.add_child(tower)
		
		lightning = LIGHTNING.instantiate()
		lightning.start_node = self
		lightning.end_node = tower
		lightning.user = user
		Projectiles.add_child(lightning)



func _on_ability_duration_timeout() -> void:
	executing = false
	cooldown.start()
	tower.queue_free()
	lightning.queue_free()
	lightning.nav_obst.queue_free()
