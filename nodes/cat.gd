class_name Cat

extends Node2D



### --- Variables --- ###

# Export variables
@export var move_dist = 130
@export var move_time = 1.0

# Onready variables
@onready var timer = $ActionTimer
@onready var animated_sprite_2d = $AnimatedSprite2D

# Regular variables
var can_move_left = true
var can_move_right = true



### --- Engine functions --- ###

# Ready. Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	decide()



### --- Custom functions --- ###

# Decides what the cat does next, then does it!
func decide():
	print("Deciding!")
	
	var choice = randi_range(0, 3) # Pick a random number between 0-2
	# 0 = Wait, 1 = Move right, 2 = Move left
	
	# I'm embarrassed by how much copy-pasted code is below.
	# TODO: Random movement speed and distance? At least distance.
	if choice == 1 and can_move_right:
		# If the cat wants to move right and it can
		animate_cat("right")
		var tween = create_tween()
		var dest = position
		dest.x += move_dist
		tween.tween_property( self, "position", dest, move_time )
		tween.tween_callback( decide )
	elif choice == 2 and can_move_left:
		# If the cat wants to move left and it can
		animate_cat("left")
		var tween = create_tween()
		var dest = position
		dest.x -= move_dist
		tween.tween_property( self, "position", dest, move_time )
		tween.tween_callback( decide )
	else:
		animate_cat("idle")
		# If the cat doesn't want to move or it cant. This isn't ideal, it means
		# the cat only has a 1/3 chance of moving out of a corner.
		# TODO: Random wait time?
		timer.start()
		# I probably don't need a timer node at this point... but whatever.

# called from within decide()
# sets the cat's animation based on decide()'s result
func animate_cat(direction:String):
	match direction: # could've used an if-elif-else, but i like match ;P -ph
		"right":
			animated_sprite_2d.flip_h = false
			animated_sprite_2d.play("walking")
		"left":
			animated_sprite_2d.flip_h = true
			animated_sprite_2d.play("walking")
		_:
			# _: acts like an "else"
			animated_sprite_2d.play("idle")


### --- Signal functions --- ###

# Called when the cat is done waiting around
func _on_action_timer_timeout():
	decide()

# Called when an area enters the area on the left of the screen
func _on_stop_moving_left_area_entered(area):
	if area.get_parent() == self:
		can_move_left = false

# Called when an area leaves the area on the left of the screen
func _on_stop_moving_left_area_exited(area):
	if area.get_parent() == self:
		can_move_left = true

# Called when an area enters the area on the right of the screen
func _on_stop_moving_right_area_entered(area):
	if area.get_parent() == self:
		can_move_right = false

# Called when an area leaves the area on the right of the screen
func _on_stop_moving_right_area_exited(area):
	if area.get_parent() == self:
		can_move_right = true
