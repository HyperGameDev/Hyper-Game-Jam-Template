extends RigidBody3D

@onready var pan = $Pan
var scroll_position: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Messenger.scroll_value.connect(on_scroll_value)


func on_scroll_value(value):
	scroll_position = value

func _process(delta: float) -> void:
	position.y = scroll_position
