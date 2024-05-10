extends Camera3D

@export var SPEED : int = 10
@export var OFFSET : int

const CAM_OFFSET_X = 90
const CAM_OFFSET_Y = .5

var playerData

var playerOne
var playerTwo

var zoomTarget
var cameraPos
var CenterZ
var CenterY
var Distance
var Direction

func _on_players_send_data_script(data):
	playerData = data

func _ready():
	pass
	

func _physics_process(_delta):
	if playerData != null:
		playerOne = playerData.playerOne
		playerTwo = playerData.playerTwo
		CenterZ = (playerTwo.global_position.z + playerOne.global_position.z) / 2
		CenterY = ((playerTwo.global_position.y + playerOne.global_position.y) / 2) + CAM_OFFSET_Y
		Distance = abs(playerTwo.global_position.z - playerOne.global_position.z)
		
		zoomTarget = clamp(CAM_OFFSET_X + Distance, 92.5,105)
		
		global_position.x += (zoomTarget - global_position.x) * .02 
		global_position.z += (CenterZ - global_position.z) * .05
		global_position.y += (CenterY - global_position.y) * .05
		

