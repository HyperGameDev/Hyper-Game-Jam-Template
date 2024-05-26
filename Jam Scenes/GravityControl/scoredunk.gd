extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	area_entered.connect(on_area_entered)


func on_area_entered(area):
	if area.is_in_group("Balls") and area.get_parent().ball_number == 1 and area.get_parent().ball_number == 2 and area.get_parent().ball_number == 3 and area.get_parent().ball_number == 4:
		Messenger.add_point.emit(1)
	
