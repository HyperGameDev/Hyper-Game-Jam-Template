extends RigidBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.timeout.connect(on_timeout)

func on_timeout():
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if position.y > 4:
		Messenger.add_point.emit(.1)
	$Label3D.set_text(str(round($Timer.get_time_left())))
