extends Entity

const ICON = preload("res://abilities/icon.tscn")

@onready var container: HBoxContainer = $CanvasLayer/Container
@onready var ability1 = load_ability("small_firekiller")
@onready var ability2 = load_ability("poison_bomb")
@onready var ability3 = load_ability("spikes")
@onready var ability4 = load_ability("megablast")

@onready var abilities = [ability1, ability2, ability3, ability4]

@onready var nav_obst: NavigationObstacle2D = $NavigationObstacle2D
@onready var remote: RemoteTransform2D = $RemoteTransform2D


func _ready() -> void:
	for ability in abilities:
		var icon = ICON.instantiate()
		icon.ability = ability
		container.add_child(icon)
	await get_tree().physics_frame
	remove_child(nav_obst)
	Game.battle_region.add_child(nav_obst)
	remote.remote_path = nav_obst.get_path()

func _process(delta: float) -> void:
	if stunned:
		return

	var direction := Input.get_vector("left", "right", "up", "down")
	move(direction, delta)
	for i in range(1, len(abilities) + 1):
		if Input.is_action_just_pressed("ability" + str(i)): 
			abilities[i-1].execute(get_global_mouse_position(), Ability.State.PRESSED)
		elif Input.is_action_pressed("ability" + str(i)): 
			abilities[i-1].execute(get_global_mouse_position(), Ability.State.HELD)
		elif Input.is_action_just_released("ability" + str(i)): 
			abilities[i-1].execute(get_global_mouse_position(), Ability.State.RELEASED)
