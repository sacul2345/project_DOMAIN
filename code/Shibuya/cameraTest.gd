extends Camera3D

@export var SPEED : int = 5

func _process(delta):
	if Input.is_action_pressed("move_up"):
		position.x -= SPEED * delta
	if Input.is_action_pressed("move_down"):
		position.x += SPEED * delta
	if Input.is_action_pressed("move_left"):
		position.z += SPEED * delta
	if Input.is_action_pressed("move_right"):
		position.z -= SPEED * delta
