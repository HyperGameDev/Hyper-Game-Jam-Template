extends RigidBody3D

var grounded = true
var dead = false


# Called when the node enters the scene tree for the first time.
func _ready():
	Messenger.player_dead.connect(on_player_dead)
	$Area_Ball.add_to_group("Detectable")
	$Area_Ball.area_entered.connect(on_area_entered)


func on_player_dead():
	dead = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and grounded and !dead:
		grounded = false
		linear_velocity += Vector3(0,10,0)
		
func on_area_entered(area):
	if area.is_in_group("Ground"):
		grounded = true
	
