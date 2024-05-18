extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.timeout.connect(on_timeout)


func on_timeout():
	$Ground/Player.upside_down = !$Ground/Player.upside_down
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$MarginContainer/Label.set_text(str(round($Timer.get_time_left())))
