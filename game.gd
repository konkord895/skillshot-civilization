extends Node

var map: RID
var battle_region: NavigationRegion2D


func _physics_process(delta: float) -> void:
	if not battle_region.is_baking():
		battle_region.bake_navigation_polygon(false)
