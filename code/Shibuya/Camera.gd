extends Camera3D

@export var SPEED : int = 10
@export var OFFSET : int

var playerData

var playerOne
var playerTwo

var Center
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
		Center = (playerTwo.global_position.z + playerOne.global_position.z) / 2
		
		global_position.z = Center


