extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _input(event):
	if event.is_action("ui_accept"):
		$MeshInstance3D.position += Vector3(.1,0,0)
