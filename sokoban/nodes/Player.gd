extends CharacterBody2D



### --- Variables --- ###

# Constants & Enums
const GRID_SIZE = 64 # Size of the tilemap tiles.
enum {IDLE, DOWN, UP, LEFT, RIGHT}

# Onready vars
@onready var look = $Look # Raycast to detect collision

# Export vars
@export var move_dur = 4.0 # Time to move between tiles

# Plain ol' variables
var input_buffer = IDLE
var moving = IDLE



### --- Engine functions --- ###

# Ready
func _ready():
	position = position.snapped( Vector2.ONE * GRID_SIZE/2 )

# Input
func _input(event):
	# If the player gets an input while moving
	if moving != IDLE:
		# If down and not already moving down,
		if event.is_action_pressed( "sok_move_down" ) and moving != DOWN:
			input_buffer = DOWN # Set input_buffer to DOWN
		# If up and not already moving up,
		elif event.is_action_pressed("move_up") and moving != UP:
			input_buffer = UP # Set input_buffer to UP
		# If left and not already moving left,
		elif event.is_action_pressed("move_left") and moving != LEFT:
			input_buffer = LEFT # Set input_buffer to LEFT
		# Or if right and not already moving right,
		elif event.is_action_pressed("move_right") and moving != RIGHT:
			input_buffer = RIGHT # Set input_buffer to RIGHT
	
	# If the player gets an input while not moving
	else:
		# Move down
		if event.is_action_pressed("move_down"):
			handle_direction_input( DOWN )
		# Move up
		elif event.is_action_pressed("move_up"):
			handle_direction_input( UP )
		# Move left
		elif event.is_action_pressed("move_left"):
			handle_direction_input( LEFT )
		# Move right
		elif event.is_action_pressed("move_right"):
			handle_direction_input( RIGHT )



### --- Custom Functions --- ###

# Handle Direction input. Called by _input()
func handle_direction_input( dir ):
	pass
