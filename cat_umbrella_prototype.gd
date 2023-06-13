extends Node2D



@onready var qm_debug = $QuestionMark



func _on_umbrella_area_exited(area):
	if area is Cat:
		qm_debug.visible = true
