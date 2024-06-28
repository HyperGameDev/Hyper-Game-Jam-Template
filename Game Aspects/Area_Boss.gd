extends Area3D

@onready var label = $Label3D

var hp = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	area_entered.connect(on_area_entered)

func on_area_entered(area):
	if area.is_in_group("Weapon"):
		hp -= 1
	if area.is_in_group("Detectable"):
		Messenger.game_over.emit(false)
	
func _process(delta):
	label.text = str(hp)	
	if hp <= 0:
		Messenger.add_point.emit(1)
		Messenger.kill_enemy.emit()
		get_owner().queue_free()
