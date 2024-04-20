extends StaticBody3D
   
@export var state1 = false
@export var default_color: Color = Color(.35,.2,.4)
@export var bounce1_color: Color = Color(1,1,.6)

@onready var mesh = $MeshInstance3D

var default_material = StandardMaterial3D.new()
var bounce1_material = StandardMaterial3D.new()

var bounces = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Platform")
	$Timer.timeout.connect(on_timer_timeout)
	
	default_material.set_albedo(default_color)
	bounce1_material.set_albedo(bounce1_color)
	mesh.material_override = default_material


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if state1:
		print("State 1 is ",state1)
		position += Vector3(6,0,0) * delta
	else:
		print("State 1 is ",state1)
		position -= Vector3(6,0,0) * delta
		
	if bounces > 0:
		mesh.material_override = bounce1_material
	
func on_timer_timeout():
	state1 = !state1
	
