extends Area3D

var moving: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("Detectable")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if moving:
		position.x += 2 * delta
