extends Node2D



### --- Variables --- ###
@onready var qm_debug = $QuestionMark



### --- Functions --- ###
func _on_umbrella_area_exited(area):
	if area.get_parent() is Cat:
		qm_debug.visible = true
