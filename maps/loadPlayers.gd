extends Node3D

var playerOne
var playerTwo
var playerOneSpawn
var playerTwoSpawn
var playerOneInstance
var playerTwoInstance

var playerGlobal

func _ready():
	playerGlobal = get_node("/root/PlayerGlobals")
	playerOneSpawn = get_node("playerOneSpawn")
	playerTwoSpawn = get_node("playerTwoSpawn")
	
	playerOne = playerGlobal.get_player(1)
	playerTwo = playerGlobal.get_player(2)
	
	playerOneInstance = playerOne.instantiate()
	playerTwoInstance = playerTwo.instantiate()
	
	playerOneSpawn.add_child(playerOneInstance)
	playerTwoSpawn.add_child(playerTwoInstance)
