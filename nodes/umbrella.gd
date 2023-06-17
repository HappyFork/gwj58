extends Area2D



### --- Variables and constants --- ###

# Constants
const  UMB_HEIGHT = 350 # Umbrella area's height/2 - 50

# Onready variables
@onready var bg_copy = $Sprite2D/BgCopy



### --- Functions --- ###

# Process. Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var pos = get_viewport().get_mouse_position()
	pos.y += UMB_HEIGHT
	position = pos
	bg_copy.global_position = Vector2.ZERO
