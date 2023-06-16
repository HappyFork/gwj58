extends Node2D



### --- Variables --- ###
@onready var qm_debug = $QuestionMark
@onready var arm_serving_tuna = $ArmServingTuna
@onready var tuna = $Tuna
@onready var tuna_timer = $TunaTimer

func _ready():
	# connects signal from the tuna
	tuna.connect("tuna_picked_up", _on_tuna_bonus_activated)

### --- Functions --- ###
func _on_umbrella_area_exited(area):
	if area.get_parent() is Cat:
		qm_debug.visible = true

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
	# TODO
	# decide if bonus is static (score += x)
	# or if it's a multiplier for a period of time
	
	# either restart the tuna_timer immediately or after the multiplier period
