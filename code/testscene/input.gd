extends RigidBody2D

var SPEED = 50

func _physics_process(delta):
	var vector = Vector2.ZERO
	if Input.is_action_pressed("player_one_move_up"):
		vector.y -= 1
	if Input.is_action_pressed("player_one_move_down"):
		vector.y += 1
	if Input.is_action_pressed("player_one_move_left"):
		vector.x -= 1
	if Input.is_action_pressed("player_one_move_right"):
		vector.x += 1
	
	movePlayer(vector * SPEED)
	
func movePlayer(vector):
	#print("(" , vector.x , " , " , vector.y , ")")
	apply_impulse(vector)
