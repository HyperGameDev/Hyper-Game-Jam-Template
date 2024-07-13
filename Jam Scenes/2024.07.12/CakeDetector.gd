extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(on_body_entered)

func on_body_entered(body):
	Messenger.add_point.emit(1)
