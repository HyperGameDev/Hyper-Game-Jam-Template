extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_drop_1_button_down():
	Messenger.button_pressed.emit()
	var drop = load("res://Game Aspects/droppable_block.tscn").instantiate()
	get_tree().get_current_scene().add_child(drop)
	drop.position = Vector3(-6,2,0)


func _on_drop_2_button_down():
	Messenger.button_pressed.emit()
	var drop = load("res://Game Aspects/droppable_block.tscn").instantiate()
	get_tree().get_current_scene().add_child(drop)
	drop.position = Vector3(1,2,0)


func _on_drop_3_button_down():
	Messenger.button_pressed.emit()
	var drop = load("res://Game Aspects/droppable_block.tscn").instantiate()
	get_tree().get_current_scene().add_child(drop)
	drop.position = Vector3(8,2,0)
