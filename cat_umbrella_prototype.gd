extends Node2D



### --- Variables --- ###

# Onready variables
@onready var arm_serving_tuna = $ArmServingTuna
@onready var tuna = $Tuna
@onready var tuna_timer = $TunaTimer
@onready var tuna_indicator = $TunaModeIndicator
@onready var score_label = $ScoreLabel
@onready var tuna_label = $TunaLabel

# Regular variables
var tuna_mode = false



### --- Engine Functions --- ###

# Ready. Runs when the scene starts
func _ready():
	# connects signal from the tuna
	tuna.connect("tuna_picked_up", _on_tuna_bonus_activated)

# Process. Runs every frame
func _process(delta):
	score_label.text = str(Global.score)
	tuna_label.text = str(Global.tuna_collected)



### --- Signal Functions --- ###

# When the cat leaves the area under the umbrella
func _on_umbrella_area_exited(area):
	if area.get_parent() is Cat:
		pass # Lose screen

# activates the tuna delivery
func _the_fish_is_served():
	arm_serving_tuna.play("serve")
	await get_tree().create_timer(1.5).timeout
	tuna.update_availability(true)

# time for some fish!
func _on_tuna_timer_timeout():
	_the_fish_is_served()

# when tuna has been picked up, hides it and activates a form of bonus
func _on_tuna_bonus_activated():
	tuna.update_availability(false)
	print("tuna bonus! yeah!")
	Global.tuna_collected += 1
	match Global.score_mode:
		Global.ScoreModeType.FLAT:
			Global.score += 42
		Global.ScoreModeType.DUR:
			tuna_mode = true
			tuna_indicator.show()
			await get_tree().create_timer( randf_range(1.0,5.0) )
			tuna_mode = false
			tuna_indicator.hide()
	
	tuna_timer.wait_time = randf_range(3.0,10.0)
	tuna_timer.start()

# Goes off every second
func _on_score_timer_timeout():
	if Global.score_mode == Global.ScoreModeType.DUR and tuna_mode:
		Global.score += 5
	else:
		Global.score += 1
