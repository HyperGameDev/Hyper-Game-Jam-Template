extends Area3D

@export var finish_line_visible = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if finish_line_visible:
		$"Finish-Line_Mesh".visible = true
	area_entered.connect(crossed)

func crossed(area):
	if area.is_in_group("Detectable"):
		Messenger.game_over.emit()
