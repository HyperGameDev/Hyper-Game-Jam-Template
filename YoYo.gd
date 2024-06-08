extends StaticBody3D

@export var down = true
@export var time = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.timeout.connect(on_timer_timeout)
	$Timer.start(time)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func on_timer_timeout():
	down = !down
	if !down:
		$AnimationPlayer.play("up_slow")
	else:
		$AnimationPlayer.play("down_slow")
	
