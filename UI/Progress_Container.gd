extends MarginContainer

@onready var progress_bar: ProgressBar = %ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Messenger.battery_used.connect(on_battery_used)

func _process(delta: float) -> void:
	Messenger.bar_amount.emit(progress_bar.value)
	if Input.is_action_pressed("ui_up"):
		progress_bar.value += .1
	else:
		progress_bar.value -= .5
		

func on_battery_used(amount):
	progress_bar.value -= amount
