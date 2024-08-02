extends Area3D

@onready var robot: Area3D = %Robot

var hovered: bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mouse_entered.connect(on_mouse_entered)
	mouse_exited.connect(on_mouse_exited)
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Grab") and hovered:
		Messenger.battery_used.emit(15)
		robot.moving = !robot.moving

func on_mouse_entered():
	hovered = true

func on_mouse_exited():
	hovered = false
