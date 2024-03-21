extends StaticBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	Messenger.open_doors_1.connect(destroy)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func destroy():
	queue_free()
