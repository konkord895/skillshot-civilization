extends Entity

var ability1 = load_ability("small_firekiller")

func _ready() -> void:
	print(ability1.name)
	
	
func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("left", "right", "up", "down")
	move(direction)
	if Input.is_action_just_pressed("ability1"): 
		ability1.execute(get_global_mouse_position())
