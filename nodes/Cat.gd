class_name Cat

extends Area2D



@export var move_dist = 130
@export var move_time = 1.0



# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()



# Called every 4 seconds
func _on_action_timer_timeout():
	var choice = randi_range(0, 3)
	
	if choice != 0:
		var tween = create_tween()
		var dest = position
		
		if choice == 1:
			dest.x += move_dist
		else:
			dest.x -= move_dist
		
		tween.tween_property( self, "position", dest, move_time )
