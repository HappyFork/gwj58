extends Area2D



### --- Variables & Constants --- ###

# Constants
const  UMB_HEIGHT = 380 # Umbrella area's height/2 - 20

# Export variables
@export var speed = 5

# Onready Variables
@onready var bg = $Sprite2D/BGCopy

# Regular variables
var keyboard : bool



### --- Functions --- ###

# Ready. Called when the node is first loaded
func _ready():
	match Global.controls:
		-1:
			get_tree().change_scene_to_file("res://scenes/end_screen.tscn")
			print( "Error. This shouldn't happen. A control scheme wasn't chosen." )
		0:
			keyboard = false
		1:
			keyboard = true

# Process. Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if keyboard:
		# If in keyboard mode, check for inputs and move
		var dir = Input.get_axis("move_left","move_right")
		position.x += dir * speed
	else:
		# If in mouse mode, move the umbrella to the mouse position
		var pos = get_viewport().get_mouse_position()
		pos.y += UMB_HEIGHT
		position = pos
	
	# Reset position of BGCopy to match the actual background
	bg.global_position = Vector2.ZERO
