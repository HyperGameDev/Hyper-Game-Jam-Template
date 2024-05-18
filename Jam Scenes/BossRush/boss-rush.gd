extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	Messenger.kill_enemy.connect(on_kill_enemy)


func on_kill_enemy():
	await get_tree().create_timer(2).timeout
	var boss = preload("res://Game Aspects/BOSSENEMY.tscn").instantiate()
	get_tree().get_current_scene().add_child(boss)
	boss.animation.play("movement")
	#log.position += (player.global_position + Vector3(0,0,-13))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
