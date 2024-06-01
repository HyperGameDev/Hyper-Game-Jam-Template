extends Panel

@export var end_on_zero = false
var time_counter = 0.0
@onready var time_shown = get_owner().timer_length

var race_begun = false
var dead = false


func _ready():
	Messenger.button_pressed.connect(on_button_pressed)
	Messenger.player_dead.connect(on_player_dead)
	Messenger.add_time.connect(on_add_time)
	if get_owner().timer_visible:
		self.visible = true
	self.visible = get_owner().timer_visible
	
	if time_shown > 60.0:
		var minutes = time_shown / 60
		var seconds = int(time_shown) % 60
		var miliseconds = time_shown *100 - int(time_shown) * 100 
		%Time.text = "%2d:%02d.%02d" % [ minutes, seconds, miliseconds ]
		
	if time_shown <= 60.0:
		%Time.text = "%.02f" % time_shown
	
func on_player_dead():
	dead = true
	
func _process(delta):
	if get_owner().timer_autostart:
		time_counter += delta
	if time_counter >= 0.01:
		time_counter = 0.0
		count(delta)
	if time_shown <= 0.00:
		get_owner().timer_autostart = false
		%Time.text = str(0)
		if end_on_zero:
			Messenger.game_over.emit()
		
	if get_owner().timer_for_racing and !race_begun and !dead:
		if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_accept"):
			get_owner().timer_autostart = true
			await get_tree().create_timer(1.0).timeout
			race_begun = true
			
func on_button_pressed():
	get_owner().timer_autostart = true
	await get_tree().create_timer(1.0).timeout
	race_begun = true

func on_add_time(time_to_add):
	print(time_to_add, " is trying to be added")
	time_shown += time_to_add

func count(delta):
	if time_shown > 60.0:
		var minutes = time_shown / 60
		var seconds = int(time_shown) % 60
		var miliseconds = time_shown *100 - int(time_shown) * 100 
		%Time.text = "%2d:%02d.%02d" % [ minutes, seconds, miliseconds ]
	
	if time_shown <= 60.0:
		%Time.text = "%.02f" % time_shown
	
	if !get_owner().timer_countup:
		time_shown -= delta
	
	if get_owner().timer_countup:
		time_shown += delta
			#Messenger.add_point.emit(-1)
		


	
