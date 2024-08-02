extends RigidBody3D

@onready var area_ball: Area3D = %Area_Ball
var power = 2
var hit = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_ball.area_entered.connect(on_area_entered)
	Messenger.bar_amount.connect(on_ball_amount)

func on_ball_amount(amount):
	power = amount/2

func on_area_entered(area):
	if area.is_in_group("Ground"):
		Messenger.game_over.emit(false)
		
func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_SPACE) and !hit:
		print("space")
		hit = true

func _integrate_forces(state: PhysicsDirectBodyState3D):
	# Example: Move towards a target
	var follow_target = %Hole.position
	var direction = (follow_target - global_position).normalized()
	var distance_to_target = global_position.distance_to(follow_target)
	if hit:
		apply_central_impulse(direction * power)
		hit = false
