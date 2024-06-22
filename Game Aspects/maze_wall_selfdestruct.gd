extends Node3D

var left = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.timeout.connect(on_timeout)
	if randi() % 2:
		left = false  
	if left:
		$BOX_R.visible = false
		$"Label Left".visible = false
		$BOX_R.use_collision = false
	else:
		$BOX_L.visible = false
		$"Label Right".visible = false
		$BOX_L.use_collision = false

func on_timeout():
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
