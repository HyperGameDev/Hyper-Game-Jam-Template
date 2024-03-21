@tool

extends StaticBody3D

@export_category("Ground Settings")
@export var ground_color: Color = Color(.13,.07,.27,1):
	set(new_color):
		ground_color = new_color
		$"Ground-Mesh".get_surface_override_material(0).set_albedo(ground_color)


# Called when the node enters the scene tree for the first time.
func _ready():
	$"Ground-Mesh".get_surface_override_material(0).set_albedo(ground_color)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
