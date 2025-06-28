extends Entity

@onready var ability1 = load_ability("small_firekiller")
@onready var ability2 = load_ability("spikes")
@onready var ability3 = load_ability("shadow_domain")

@onready var abilities = {
	1: ability1,
	2: ability2,
	3: ability3,
}

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("left", "right", "up", "down")
	move(direction)
	for i in range(1, len(abilities) + 1):
		if Input.is_action_just_pressed("ability" + str(i)): 
			abilities[i].execute(get_global_mouse_position(), Ability.State.PRESSED)
		elif Input.is_action_pressed("ability" + str(i)): 
			abilities[i].execute(get_global_mouse_position(), Ability.State.HELD)
		elif Input.is_action_just_released("ability" + str(i)): 
			abilities[i].execute(get_global_mouse_position(), Ability.State.RELEASED)
