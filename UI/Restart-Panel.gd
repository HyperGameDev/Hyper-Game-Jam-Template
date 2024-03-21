extends Panel


# Called when the node enters the scene tree for the first time.
func _ready():
	$"Restart-Box/Restart-Button".pressed.connect(restart)
	Messenger.game_over.connect(showing)

func showing():
	show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func restart():
	Engine.set_time_scale(1)
	get_tree().reload_current_scene()
