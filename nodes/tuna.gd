extends Area2D

signal tuna_picked_up
@onready var collision_shape_2d = $CollisionShape2D


# initially turn the fish off 
func _ready():
	update_availability(false)

# when cat collides, sends signal which is picked up in cat_umbrella_prototype
func _on_area_entered(area):
	if area.get_parent() is Cat:
		update_availability(false)
		emit_signal("tuna_picked_up")

# fish bobs up and down, continues as long as it's visible
func float_up_and_down():
	await create_tween().tween_property(self, "position", Vector2(0, -16), 1).as_relative().set_trans(Tween.TRANS_SINE).finished
	await create_tween().tween_property(self, "position", Vector2(0, 16), 1).as_relative().set_trans(Tween.TRANS_SINE).finished
	if self.visible:
		float_up_and_down()

# function to manage the display and collision detection of the fish
func update_availability(tuna_available :bool):
	await get_tree().process_frame # 
	if tuna_available:
		float_up_and_down()
		self.show()
		self.monitoring = true
	else:
		self.hide()
		self.monitoring = false
