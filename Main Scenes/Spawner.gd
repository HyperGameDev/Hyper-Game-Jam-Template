class_name Spawn_Point
extends Node3D

@export var spawn_object: PackedScene = preload("res://Game Aspects/spawn.tscn")
@onready var placeholder := $MeshInstance3D

var spawn_limit = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	# Hide the capsule ingame
	placeholder.hide()
	spawn_limit = $"..".spawn_limit

func spawn():
	var spawn = spawn_object.instantiate()
	if $"..".spawn_infinitely:
		get_tree().get_current_scene().add_child(spawn)
		spawn.set_global_position(self.global_position)
	else: 
		spawn_limit -= 1
		if spawn_limit >= 0:
			get_tree().get_current_scene().add_child(spawn)
			spawn.set_global_position(self.global_position)
