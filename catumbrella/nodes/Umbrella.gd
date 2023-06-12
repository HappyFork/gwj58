extends Area2D


const  UMB_HEIGHT = 200


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var pos = get_viewport().get_mouse_position()
	pos.y += UMB_HEIGHT
	position = pos
