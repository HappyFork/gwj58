extends Control



### --- Variables --- ###
@onready var sec_l = $Seconds
@onready var tun_l = $Tuna
@onready var fin_l = $Final



### --- Functions --- ###

# Called when the node enters the scene tree for the first time.
func _ready():
	# Show seconds and tunas collected
	sec_l.text = str(Global.seconds)
	tun_l.text = str(Global.tunas_collected)
	
	# Calculate the final score. Right now, the formula is a flat 42 bonus for each tuna,
	# but it could just as easily be a multiplier on seconds per each tuna.
	var s = Global.tunas_collected * 42
	s += Global.seconds
	fin_l.text = str(s)
