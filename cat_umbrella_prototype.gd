extends Node2D



### --- Variables --- ###

# Onready variables
@onready var arm_serving_tuna = $ArmServingTuna
@onready var tuna = $Tuna
@onready var tuna_timer = $TunaTimer
@onready var cat = $Cat
@onready var ding = $Ding
@onready var meow = $Meow

# Regular variables
var ending = load("res://scenes/end_screen.tscn")



### --- Engine Functions --- ###

# Ready. Called when the scene starts
func _ready():
	# connects signal from the tuna
	tuna.connect("tuna_picked_up", _on_tuna_bonus_activated)


### --- Custom Functions --- ###

# activates the tuna delivery
func _the_fish_is_served():
	arm_serving_tuna.play("serve")
	await get_tree().create_timer(1.5).timeout
	tuna.update_availability(true)
	ding.play()
	cat.tuna_hunting = true # Cat will go toward tuna


### --- Signal Functions --- ###

# When the cat leaves the area under the umbrella
func _on_umbrella_area_exited(area):
	if area.get_parent() is Cat:
		get_tree().change_scene_to_packed(ending)

# time for some fish!
func _on_tuna_timer_timeout():
	_the_fish_is_served()

# when tuna has been picked up, hides it and activates a form of bonus
func _on_tuna_bonus_activated():
	tuna.update_availability(false) # Tuna is no longer available.
	print("tuna bonus! yeah!")
	Global.tunas_collected += 1 # Increase tunas collected
	
	# Cat no longer beelines to the tuna
	cat.tuna_hunting = false
	
	# Reset the tuna timer with a random time between 30 and 100 seconds.
	tuna_timer.wait_time = randf_range(30.0,100.0)
	tuna_timer.start()

# Every second, increase the second score by one
func _on_score_timer_timeout():
	Global.seconds += 1

# When the cat finishes meowing
func _on_meow_finished():
	var time = randf_range( 70.0, 300.0 )
	await get_tree().create_timer( time ).timeout # Wait from 70 to 300 secs to meow again
	meow.play()
