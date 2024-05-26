extends RigidBody3D
class_name Balls

@export var ball_number: int

# Called when the node enters the scene tree for the first time.
func _ready():
	$Area3D.add_to_group("Balls")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
