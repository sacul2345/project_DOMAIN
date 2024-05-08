extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 5.5
var direction
var Sprite

func _ready():
	Sprite = get_node("AnimatedSprite3D")

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta

	if Input.is_action_just_pressed("move_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		if Input.is_action_pressed("move_left"):
			direction = Vector3(0,0,1)
			Sprite.flip_h = true
		if Input.is_action_pressed("move_right"):
			direction = Vector3(0,0,-1)
			Sprite.flip_h = false
	else:
		direction = Vector3.ZERO
	
	if direction:
		velocity.z = direction.z * SPEED
		Sprite.play("walk")
		
	else:
		velocity.z = move_toward(velocity.z, 0, SPEED)
		Sprite.play("idle")
	move_and_slide()
