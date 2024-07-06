extends Node3D

var dead = false


# Called when the node enters the scene tree for the first time.
func _ready():
	Messenger.game_over.connect(on_game_over)
	%Area3D.area_entered.connect(on_area_entered)
	#
#func _process(delta):
	#if abs(position.z) > 1 and !dead:
		#Messenger.add_point.emit(1)
		
func on_game_over(won):
	if !won:
		dead = true


func on_area_entered(area):
	if area.is_in_group("Player"):
		Messenger.game_over.emit(false)
