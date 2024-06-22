extends Panel


# Called when the node enters the scene tree for the first time.
func _ready():
	$"Restart-Box/Restart-Button".pressed.connect(restart)
	Messenger.game_over.connect(showing)
	if get_owner().restart_visible:
		show()

func showing(won):
	show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func restart():
	Engine.set_time_scale(1)
	get_tree().reload_current_scene()
