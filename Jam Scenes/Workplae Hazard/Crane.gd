extends Node3D

@onready var ball = $Spawn_Physical
var length = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	length = randi_range(0,6)
	$Timer.timeout.connect(on_timeout)
	$Timer.start(length)

func on_timeout():
	ball.set_freeze_enabled(false)
	print(length)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
