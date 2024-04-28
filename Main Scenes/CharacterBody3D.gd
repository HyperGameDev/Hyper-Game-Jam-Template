extends CharacterBody3D


const SPEED = 6
const JUMP_VELOCITY = 3

# Get the gravity from the project ssettings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@export var tester_button = false

var game_over = false
var add_point = false

func _ready():
	Messenger.game_over.connect(end_game)
	Messenger.player_dead.connect(kill_player)
	Messenger.on_bought_prism.connect(bought_prism)
	Messenger.on_bought_square.connect(bought_square)
	
	add_to_group("Detectable")
	
func bought_prism():
	$Player_Mesh_Square.visible = false
	$Player_Collision_Square.disabled = true
	
	$Player_Mesh_Prism.visible = true
	$Player_Collision_Prism.disabled = false
	
func bought_square():
	$Player_Mesh_Square.visible = true
	$Player_Collision_Square.disabled = false
	
	$Player_Mesh_Prism.visible = false
	$Player_Collision_Prism.disabled = true
	
func end_game():
	#Engine.set_time_scale(.3)
	#await get_tree().create_timer(.3).timeout
	game_over = true
	
func kill_player():
	$".".visible = false


func _physics_process(delta):
	if %RayCast3D.is_colliding():
		%RayCast3D.get_collider().bounces = 1

	if !game_over:
		movement(delta)
		
	if self.global_position.y <= -50:
		get_tree().reload_current_scene()

		
	
	# Tester Button
	if Input.is_action_just_pressed("tester") and tester_button:
		var point = 9
		Messenger.add_point.emit(point)
		
		
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

func movement(delta):
	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$Weapon_Area/Weapon_Collision.disabled = false
		$Weapon_Area/Weapon.visible = true
		await get_tree().create_timer(.3).timeout
		$Weapon_Area/Weapon_Collision.disabled = true
		$Weapon_Area/Weapon.visible = false

	# Get the input direction and handle the movement/deceleration.aw
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	# For 2D movement, just swap everything after = with 0 on each the if and else
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		
	#velocity.x = 0
	#velocity.z = -1 * SPEED

	move_and_slide()
