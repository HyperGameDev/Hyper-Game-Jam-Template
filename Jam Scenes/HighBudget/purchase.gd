extends Node3D

@export var is_1: bool = false
@export var is_10: bool = false
@export var is_30: bool = false
@export var is_65: bool = false
@export var is_100: bool = false

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if is_1:
		%"1".visible = true
		$"1/CollisionShape3D".disabled = false
	if is_10:
		%"10".visible = true
		$"10/CollisionShape3D".disabled = false
	if is_30:
		%"30".visible = true
		$"30/CollisionShape3D".disabled = false
	if is_65:
		%"65".visible = true
		$"65/CollisionShape3D".disabled = false
	if is_100:
		%"100".visible = true
		$"100/CollisionShape3D".disabled = false
