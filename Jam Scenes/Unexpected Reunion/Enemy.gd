extends Node3D

func _ready():
	#$AnimationPlayer.play("enemybounce")
	$Enemy_Area.area_entered.connect(been_hit)
	

func been_hit(area):
	if area.is_in_group("Weapon"):
		Messenger.open_doors_1.emit()
		await get_tree().create_timer(.01).timeout
		queue_free()
