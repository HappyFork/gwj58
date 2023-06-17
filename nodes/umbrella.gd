extends Area2D



### --- Variables & Constants --- ###

# Constants
const  UMB_HEIGHT = 350 # Umbrella area's height/2 - 50

# Onready Variables
@onready var bg = $Sprite2D/BGCopy



### --- Functions --- ###

# Process. Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# Move the umbrella to the mouse position
	var pos = get_viewport().get_mouse_position()
	pos.y += UMB_HEIGHT
	position = pos
	
	# Reset position of BGCopy to match the actual background
	bg.global_position = Vector2.ZERO
