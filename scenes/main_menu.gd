extends Control



### --- Variables --- ###

# Export variables
@export var game_scene = load("res://cat_umbrella_prototype.tscn")

# Onready variables
@onready var controls = $ControlOptions
@onready var score = $ScoreOptions
@onready var err_label = $ErrorLabel



### --- Functions --- ###
func _on_play_button_pressed():
	if controls.selected == -1 or score.selected == -1:
		err_label.show()
	else:
		match controls.selected:
			0:
				Global.control_mode = Global.ControlModeType.MOUSE
			1:
				Global.control_mode = Global.ControlModeType.KEYBOARD
		
		match score.selected:
			0:
				Global.score_mode = Global.ScoreModeType.MULT
			1:
				Global.score_mode = Global.ScoreModeType.FLAT
			2:
				Global.score_mode = Global.ScoreModeType.DUR
				
		get_tree().change_scene_to_packed( game_scene )
