extends Area3D

@export var finish_line_visible = false
@export var is_checkpoint = false
@export var wins_game = true

# Called when the node enters the scene tree for the first time.
func _ready():
	if finish_line_visible:
		$"Finish-Line_Mesh".visible = true
	area_entered.connect(crossed)

func crossed(area):
	if area.is_in_group("Detectable"):
		if wins_game:
			Messenger.game_win.emit()
			Messenger.game_over.emit(true)
		if !is_checkpoint:
			Messenger.game_over.emit(true)
		if is_checkpoint:
			Messenger.close_doors_1.emit()
