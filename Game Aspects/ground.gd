@tool

extends StaticBody3D

@export_category("Ground Settings")
@export var ground_color: Color = Color(.13,.07,.27,1):
	set(new_color):
		ground_color = new_color
		$"Ground-Mesh".get_surface_override_material(0).set_albedo(ground_color)

@export_range(0,1) var ground_roughness: float = 1:
	set(new_roughness):
		ground_roughness = new_roughness
		$"Ground-Mesh".get_surface_override_material(0).set_roughness(ground_roughness)
		
@export_range(0,1) var ground_metallic: float = 0:
	set(new_metallic):
		ground_metallic = new_metallic
		$"Ground-Mesh".get_surface_override_material(0).set_metallic(ground_metallic)
		
@export_range(0,1) var ground_specular: float = 0.5:
	set(new_specular):
		ground_specular = new_specular
		$"Ground-Mesh".get_surface_override_material(0).set_specular(ground_specular)

# Called when the node enters the scene tree for the first time.
func _ready():
	$"Ground-Mesh".get_surface_override_material(0).set_albedo(ground_color)
	$Area_Ground.add_to_group("Ground")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
