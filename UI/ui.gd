extends CanvasLayer

@export_category("General")
@export var restart_visible = false
@export_category("Timer")
@export var timer_visible = false
@export_group("Timer Settings")
@export var timer_for_racing = true # Starts timer on direction press
@export var timer_length = 99.0
@export var timer_autostart = false
@export var timer_countup = false

@export_category("Score")
@export var score_visible = false
@export_group("Score Settings")
@export var score_something = false


func _ready():
	Messenger.game_over.connect(end_game)
	Messenger.game_win.connect(show_win)
	
func end_game(won):
	timer_autostart = false
	if !won:
		%"You Lost".visible = true
	else:
		%"You Won".visible = true
	pass

func show_win():
	#%"You Won".visible = true
	pass
