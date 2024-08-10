extends Node3D

var spawn_pos: Vector3 = Vector3(0,5,0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Messenger.bought_1.connect(on_bought_1)
	Messenger.bought_10.connect(on_bought_10)
	Messenger.bought_30.connect(on_bought_30)
	Messenger.bought_65.connect(on_bought_65)
	Messenger.bought_100.connect(on_bought_100)

func on_bought_1():
	var purchase = load("res://Jam Scenes/HighBudget/purchase.tscn").instantiate()
	get_tree().get_current_scene().add_child(purchase)
	purchase.is_1 = true
	purchase.position = spawn_pos
	
func on_bought_10():
	var purchase = load("res://Jam Scenes/HighBudget/purchase.tscn").instantiate()
	get_tree().get_current_scene().add_child(purchase)
	purchase.is_10 = true
	purchase.position = spawn_pos
	
func on_bought_30():
	var purchase = load("res://Jam Scenes/HighBudget/purchase.tscn").instantiate()
	get_tree().get_current_scene().add_child(purchase)
	purchase.is_30 = true
	purchase.position = spawn_pos
	
func on_bought_65():
	var purchase = load("res://Jam Scenes/HighBudget/purchase.tscn").instantiate()
	get_tree().get_current_scene().add_child(purchase)
	purchase.is_65 = true
	purchase.position = spawn_pos
	
func on_bought_100():
	var purchase = load("res://Jam Scenes/HighBudget/purchase.tscn").instantiate()
	get_tree().get_current_scene().add_child(purchase)
	purchase.is_100 = true
	purchase.position = spawn_pos
