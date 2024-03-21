extends CanvasLayer

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
	Messenger.you_won.connect(show_win)
	
func end_game():
	timer_autostart = false

func show_win():
	$Label.visible = true
