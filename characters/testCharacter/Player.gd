extends CharacterBody3D

const SPEED = 4.0
const JUMP_VELOCITY = 17

var playerData

var direction
var Sprite
var parentNode

var inputUp
var inputDown
var inputRight
var inputLeft

var leftRaycast
var rightRaycast

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	
	parentNode = get_parent()
	Sprite = get_node("AnimatedSprite3D")
	
	leftRaycast = get_node("LeftRayCast")
	rightRaycast = get_node("RightRayCast")
	
	# maybe make this a list of enums in the future in global player because
	# this is going to become a mess once more controls are added..
	
	if(parentNode.name == "playerOneContainer"):
		get_tree().call_group("Players","_player_loaded",0)
		inputUp = "player_one_move_up"
		inputDown = "player_one_move_down"
		inputRight = "player_one_move_right"
		inputLeft = "player_one_move_left"

		
	else:
		get_tree().call_group("Players","_player_loaded",1)
		inputUp = "player_two_move_up"
		inputDown = "player_two_move_down"
		inputRight = "player_two_move_right"
		inputLeft = "player_two_move_left"
		Sprite.flip_h = true
		
	playerData = parentNode.get_parent()
	
#func _flip_player():
	#Sprite.flip_h = not Sprite.flip_h
	
func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y -= gravity * delta
		Sprite.play("jump")

	if Input.is_action_just_pressed(inputUp) and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if Input.is_action_pressed(inputLeft) or Input.is_action_pressed(inputRight):
		if Input.is_action_pressed(inputLeft):
			if not leftRaycast.is_colliding():
				direction = Vector3(0,0,1)
			else:
				direction = Vector3(0,0,0)
		if Input.is_action_pressed(inputRight):
			if not rightRaycast.is_colliding():
				direction = Vector3(0,0,-1)
			else:
				direction = Vector3(0,0,0)
	else:
		direction = Vector3.ZERO
	
	if direction:
		velocity.z = direction.z * SPEED
		if is_on_floor():
			Sprite.play("run")
		
	else:
		velocity.z = move_toward(velocity.z, 0, SPEED)
		if is_on_floor():
			Sprite.play("idle")
	
	move_and_slide()
