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
		
		
		
@export_category("Sky Settings")
@export var sky_top_color: Color = Color(.337,.431,.718,1):
	set(new_color):
		sky_top_color = new_color
		environment.sky.sky_material.set_sky_top_color(sky_top_color)
		
@export var sky_horizon_color: Color = Color(.392,.42,.62,1):
	set(new_color):
		sky_horizon_color = new_color
		environment.sky.sky_material.set_sky_horizon_color(sky_horizon_color)
		
@export_range(0,4,.0001) var sky_color_curve: float = .150:
	set(new_curve):
		sky_color_curve = new_curve
		environment.sky.sky_material.set_sky_curve(sky_color_curve)
		
@export_range(0,64,.0001) var sky_energy: float = 1.0:
	set(new_energy):
		sky_energy = new_energy
		environment.sky.sky_material.set_sky_energy_multiplier(sky_energy)
		
		
		
@export_category("Ground Settings")
@export var ground_bottom_color: Color = Color(.2,.169,.133,1):
	set(new_color):
		ground_bottom_color = new_color
		environment.sky.sky_material.set_ground_bottom_color(ground_bottom_color)
		
@export var ground_horizon_color: Color = Color(.278,.22,0,1):
	set(new_color):
		ground_horizon_color = new_color
		environment.sky.sky_material.set_ground_horizon_color(ground_horizon_color)
		
@export_range(0,4,.0001) var ground_color_curve: float = .0199:
	set(new_curve):
		ground_color_curve = new_curve
		environment.sky.sky_material.set_ground_curve(ground_color_curve)
		
@export_range(0,64,.0001) var ground_energy: float = 1.0:
	set(new_energy):
		ground_energy = new_energy
		environment.sky.sky_material.set_ground_energy_multiplier(ground_energy)
		
# Called when the node enters the scene tree for the first time.
func _ready():
	$DirectionalLight3D.set_color(sun_color)
	$DirectionalLight3D.light_energy = sun_energy
