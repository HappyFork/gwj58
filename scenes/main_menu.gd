extends Control



### --- Variables --- ###
@export var game_scene = load("res://cat_umbrella_prototype.tscn")



### --- Functions --- ###
func _on_play_button_pressed():
	get_tree().change_scene_to_packed( game_scene )
