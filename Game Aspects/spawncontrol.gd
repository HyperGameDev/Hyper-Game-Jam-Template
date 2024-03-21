class_name Spawn_Controller
extends Timer

@export var spawn_infinitely = true
@export var spawn_limit = 15

var spawns_spawned
var spawn_points

func _ready():
	spawn_points = get_children()
	timeout.connect(spawn_at_points)

func spawn_at_points():
	for point in spawn_points:
		point.spawn()
