extends TextureRect

var ability: Ability
@onready var cooldown_visual: TextureProgressBar = $CooldownVisual
@onready var duration_visual: TextureRect = $DurationVisual


func _ready() -> void:
	texture = ability.ICON_TEXTURE


func _process(delta: float) -> void:
	cooldown_visual.value = ability.cooldown.time_left/ability.cooldown.wait_time * 100.0
	if ability.executing:
		duration_visual.visible = true
	else:
		duration_visual.visible = false
