extends Projectile

var entities_inside = []
 

func _ready() -> void:
	init_nav()


func _process(delta: float) -> void:
	for entity in entities_inside:
		pass # Poison


func _on_area_entered(area: Area2D) -> void:
	entities_inside.append(area)

func _on_area_exited(area: Area2D) -> void:
	entities_inside.erase(area)
