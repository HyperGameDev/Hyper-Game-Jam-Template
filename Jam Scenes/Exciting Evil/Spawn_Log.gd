extends Area3D

@onready var player = $"../Player"


# Called when the node enters the scene tree for the first time.
func _ready():
	area_entered.connect(on_area_entered)

func on_area_entered(area):
	if area.is_in_group("Detectable"):
		var log = preload("res://Game Aspects/log.tscn").instantiate()
		get_tree().get_current_scene().add_child(log)
		log.position += (player.global_position + Vector3(0,0,-13))

