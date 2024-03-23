extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	Messenger.open_doors_1.connect(destroy)
	Messenger.close_doors_1.connect(bringback)

func bringback():
	$CSGBox3D.use_collision = true
	$CSGBox3D.visible = true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func destroy():
	$CSGBox3D.use_collision = false
	$CSGBox3D.visible = false
