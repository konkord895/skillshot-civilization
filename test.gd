extends Node2D


func _ready() -> void:
	Game.battle_region = $NavigationRegion2D
	Game.map = get_world_2d().navigation_map
