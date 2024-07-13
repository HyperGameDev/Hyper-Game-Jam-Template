extends MarginContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$VScrollBar.value_changed.connect(on_value_changed)

func on_value_changed(value):
	Messenger.scroll_value.emit(value)
