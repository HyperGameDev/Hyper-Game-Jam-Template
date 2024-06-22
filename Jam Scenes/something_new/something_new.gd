extends Node3D
var once = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.timeout.connect(on_timer_timeout)
	Messenger.button_pressed.connect(on_button_pressed)

func on_timer_timeout():
	var wall = load("res://Game Aspects/maze_wall_selfdestruct.tscn").instantiate()
	get_tree().get_current_scene().add_child(wall)
	wall.position = Vector3($Player.position.x,$Player.position.y,$Player.position.z - 2)
	
func on_button_pressed():
	$Timer.start(1)
	if !once:
		on_timer_timeout()
		once = true
	
