extends Area3D

class_name Detectable_Area


# Called when the node enters the scene tree for the first time.
func _ready():
	self.add_to_group("Detectable")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
