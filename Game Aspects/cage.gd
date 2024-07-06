extends Node3D

@onready var wall_back = %LongMazeWall_back
@onready var wall_front = %LongMazeWall_front

var cage_speed = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var tween_back = get_tree().create_tween();
	tween_back.tween_property(wall_back, "position:z", 0, cage_speed)
	var tween_front = get_tree().create_tween();
	tween_front.tween_property(wall_front, "position:z", 0, cage_speed)
