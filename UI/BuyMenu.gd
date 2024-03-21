extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_square_pressed():
	Messenger.on_bought_square.emit()



func _on_prism_pressed():
	Messenger.on_bought_prism.emit()
