extends Node3D

var train
var animation

func _ready():
	train = $"../TrainPos/Train/TrainArea/CollisionShape3D"
	animation = $"../TrainPos/TrainAnimation"

func _process(_delta):
	if Input.is_action_just_pressed("test_button"):
		animation.play("Cube_006Action_001")
		#get_tree().call_group("RoundLights","_on_flicker_lights")
	if Input.is_action_just_pressed("reset_button"):
		animation.stop()
		
func _on_train_detection_area_entered(_train):
	print("test")
	get_tree().call_group("RoundLights","_on_flicker_lights")
	
