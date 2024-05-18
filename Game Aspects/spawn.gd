extends Node3D

class_name Spawn

@export_category("Spawn Movement")
@export var spawn_moving = true
@export var spawn_direction = Vector3(1,0,0)
@export_range(0, .1) var spawn_velocity = 5

@export_category("Spawn Properties")
@export var spawn_appearance : PackedScene
@export var spawn_is_enemy = false
@export var spawn_is_collectible = true
@export_group("Node")
@export var enemy_instakills = true
@export_group("Collectible Settings")
@export var collectible_points = 1
@export var collectible_despawn_time = .1
@export var spawn_adds_time = false
@export var spawn_opens_door = false




func _ready():
	$Spawn_Area.area_entered.connect(player_collided)
	if !spawn_appearance == null:
		get_node("Spawn_Mesh").add_child(spawn_appearance.instantiate())

func _process(delta):
	if spawn_moving:
		position += spawn_velocity * spawn_direction.normalized() * delta
		
func player_collided(area):
	if area.is_in_group("Detectable"):
		if spawn_is_enemy and enemy_instakills:
			Messenger.player_dead.emit()
			Messenger.game_over.emit()
			
		if spawn_is_collectible:
			if area.is_in_group("Detectable"):
				$Spawn_Mesh.visible = false
				Messenger.add_point.emit(collectible_points)
				if spawn_adds_time:
					var time_to_add: float = 2
					Messenger.add_time.emit(time_to_add)
				if spawn_opens_door:
					Messenger.open_doors_1.emit()
				
			
			await get_tree().create_timer(collectible_despawn_time).timeout
			queue_free()
