extends Area2D
@onready var delet: Timer = $Delet

var direction := Vector2.ZERO

func _ready() -> void:
	rotation = direction.angle()
	delet.start()


func _on_delet_timeout() -> void:
	queue_free()
	pass # Replace with function body.
