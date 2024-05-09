extends Node3D

var playerOne
var playerTwo
var playerOneSpawn
var playerTwoSpawn

var playerGlobal

func _ready():
	playerGlobal = get_node("/root/PlayerGlobals")
	playerOneSpawn = get_node("playerOneContainer")
	playerTwoSpawn = get_node("playerTwoContainer")
	
	playerOne = playerGlobal.get_player(1).instantiate()
	playerTwo = playerGlobal.get_player(2).instantiate()
	
	
	playerOneSpawn.add_child(playerOne)
	playerTwoSpawn.add_child(playerTwo)
