extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	area_entered.connect(checkpoint)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func checkpoint(area):
	$"../Enemy2".visible = true
	$"../Enemy2/Spawn_Controller".start(1)
	
	# Had to add this or else there was issue where the visible being set to true above would conflict with it being changed to false later
	await get_tree().create_timer(.1).timeout
	queue_free()
