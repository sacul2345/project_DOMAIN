extends CharacterBody3D


const SPEED = 4.0
const JUMP_VELOCITY = 17
var direction
var Sprite
var parentNode

var inputUp
var inputDown
var inputRight
var inputLeft

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	parentNode = get_parent()
	Sprite = get_node("AnimatedSprite3D")
	
	# maybe make this a list of enums in the future in global player because
	# this is going to become a mess once more controls are added..
	
	if(parentNode.name == "playerOneContainer"):
		inputUp = "player_one_move_up"
		inputDown = "player_one_move_down"
		inputRight = "player_one_move_right"
		inputLeft = "player_one_move_left"
	else:
		inputUp = "player_two_move_up"
		inputDown = "player_two_move_down"
		inputRight = "player_two_move_right"
		inputLeft = "player_two_move_left"
		Sprite.flip_h = true
	
func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta
		Sprite.play("jump")

	if Input.is_action_just_pressed(inputUp) and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if Input.is_action_pressed(inputLeft) or Input.is_action_pressed(inputRight):
		if Input.is_action_pressed(inputLeft):
			direction = Vector3(0,0,1)
			Sprite.flip_h = true
		if Input.is_action_pressed(inputRight):
			direction = Vector3(0,0,-1)
			Sprite.flip_h = false
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
