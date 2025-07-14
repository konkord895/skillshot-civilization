extends TextureRect


@onready var texture_progress_bar: TextureProgressBar = $TextureProgressBar
var cooldown: Timer

func _process(delta: float) -> void:
	texture_progress_bar.value = cooldown.time_left/cooldown.wait_time * 100.0
