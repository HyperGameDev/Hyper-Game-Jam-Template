extends Area2D

@onready var mouse = %Mouse
var clicked = false
var is_area = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mouse.area_entered.connect(on_area_entered)
	pass
	
func _process(delta: float) -> void:
	if clicked:
		position = mouse.position
	if Input.is_action_pressed("space"):
		clicked = false
		
	if is_area == self and Input.is_action_pressed("Grab"):
		clicked = true


func on_area_entered(area):
	is_area = area
