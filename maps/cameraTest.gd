extends Camera3D


func _process(delta):
	if Input.is_action_pressed("move_up"):
		position.x -= 1
	if Input.is_action_pressed("move_down"):
		position.x += 1
	if Input.is_action_pressed("move_left"):
		position.z += 1
	if Input.is_action_pressed("move_right"):
		position.z -= 1
