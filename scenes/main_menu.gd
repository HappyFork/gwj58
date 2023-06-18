extends Control



### --- Variables --- ###
@export var game_scene = load("res://cat_umbrella_prototype.tscn")



### --- Functions --- ###
#func _on_play_button_pressed():
#	get_tree().change_scene_to_packed( game_scene )

# Start with mouse controls
func _on_mouse_play_pressed():
	Global.controls = 0
	get_tree().change_scene_to_packed( game_scene )

# Start with keyboard controls
func _on_keyboard_play_pressed():
	Global.controls = 1
	get_tree().change_scene_to_packed( game_scene )
