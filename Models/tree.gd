extends Area3D

var checked = false

# Called when the node enters the scene tree for the first time.
func _ready():
	area_entered.connect(on_area_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func on_area_entered(area):
	if area.is_in_group("Detectable") and !checked:
		Messenger.add_point.emit(500)
		checked = true
		get_owner().queue_free()
