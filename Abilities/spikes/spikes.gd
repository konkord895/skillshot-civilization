extends Ability

const SPIKE = preload("res://Abilities/spikes/spike_projectile.tscn")
##Кароче, я хз как мы будем называть там, где у нас типо планы расписаны, как в paint.
##Поэтому буду называть вебсранцу "Plancheck"/"Планчик"(P.s.прикольно на и на английском, и на русском)
##Крч чекни его, я там записал идеи по поводу spike и остальное. Время 5:11 поэтому я пошел спать

func _execute(target: Vector2) -> void:
	var dspike_inst = SPIKE.instantiate()
	dspike_inst.global_position = target
	get_node("/root/Projectiles").add_child(dspike_inst)
	pass
