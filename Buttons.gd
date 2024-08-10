extends CanvasLayer

var money = 1000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%"1".pressed.connect(on_1_pressed)
	%"10".pressed.connect(on_10_pressed)
	%"30".pressed.connect(on_30_pressed)
	%"65".pressed.connect(on_65_pressed)
	%"100".pressed.connect(on_100_pressed)
	
func _process(delta: float) -> void:
	
	%Label.set_text(str(round(money)))
	if money <= 0:
		%Buttons.visible = false
		
func on_1_pressed():
	Messenger.bought_1.emit()
	money -= 1
	
func on_10_pressed():
	Messenger.bought_10.emit()
	money -= 10
	
func on_30_pressed():
	Messenger.bought_30.emit()
	money -= 30
	
func on_65_pressed():
	Messenger.bought_65.emit()
	money -= 65
	
func on_100_pressed():
	Messenger.bought_100.emit()
	money -= 100
