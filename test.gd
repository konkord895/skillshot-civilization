extends NavigationRegion2D


func _ready() -> void:
	Game.battle_region = self
	Game.map = get_world_2d().navigation_map
