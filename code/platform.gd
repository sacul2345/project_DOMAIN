extends StaticBody2D

var platform : Node2D
var ball : Node2D
var maxSpeed : float = 400.0
var AMPLIFY : int = 3

func _ready():
	platform = get_parent().get_node("Platform")
	ball = get_parent().get_node("Ball")

func _physics_process(delta):
	var distance = ball.position.x - platform.position.x
	
	if abs(distance) > 0.01:
		var speed = min(maxSpeed, abs(distance)) * sign(distance)
		print(speed, " , " , delta)
		platform.position.x += (speed * delta) * AMPLIFY
