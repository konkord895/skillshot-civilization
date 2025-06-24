extends Entity

func _ready() -> void:
	var ability1 = load_ability("test_ability")
	print(ability1.name)
	
	
func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("left", "right", "up", "down")
	move(direction)
	#if Input.is_action_just_pressed("ability1"): 
