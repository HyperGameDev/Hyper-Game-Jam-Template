extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	area_entered.connect(on_area_entered)

func on_area_entered(area):
	if area.is_in_group("Detectable"):
		Messenger.game_over.emit(false)
