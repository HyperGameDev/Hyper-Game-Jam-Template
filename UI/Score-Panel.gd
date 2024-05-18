extends Panel

var score = 0
var scoring_allowed = true


# Called when the node enters the scene tree for the first time.
func _ready():
	#update_score(500)
	Messenger.game_over.connect(stop_scoring)
	
	if get_owner().score_visible:
		self.visible = true
	Messenger.add_point.connect(update_score)

func update_score(new_points):
	if scoring_allowed:
		score += new_points
		%Score.text = str(score)
	
func stop_scoring():
	scoring_allowed = false

func _process(delta):
	#if score <= 0:
		#%AudioStreamPlayer.playing = true
		#Messenger.game_over.emit()	
	pass
