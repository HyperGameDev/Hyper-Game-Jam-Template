@tool

extends WorldEnvironment

@export_category("Sun Settings")
@export var sun_color: Color = Color(1,1,1,1):
	set(new_color):
		sun_color = new_color
		$DirectionalLight3D.set_color(sun_color)
@export_range(0.0, 16.0) var sun_energy = 1.0:
	set(new_energy):
		sun_energy = new_energy
		$DirectionalLight3D.light_energy = new_energy

# Called when the node enters the scene tree for the first time.
func _ready():
	$DirectionalLight3D.set_color(sun_color)
	$DirectionalLight3D.light_energy = sun_energy
