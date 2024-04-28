extends Area3D

class_name Detectable_Area

var in_room = false


# Called when the node enters the scene tree for the first time.
func _ready():
	self.add_to_group("Detectable")
	area_entered.connect(on_area_entered)
	area_exited.connect(on_area_exited)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if in_room and Input.is_action_just_pressed("ui_accept"):
		Messenger.add_point.emit(1)
	
	#if !in_room and Input.is_action_just_pressed("ui_accept"):
		#Messenger.add_point.emit(-4)
		
	
func on_area_entered(area):
	if area.is_in_group("Platform"):
		Messenger.add_point.emit(1)
	if area.is_in_group("Room"):
		in_room = true

func on_area_exited(area):
	if area.is_in_group("Room"):
		in_room = false
