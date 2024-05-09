extends Node

var playerOne
var playerTwo

#this will have to be changed this is just for testing

func _ready():
	playerOne = "res://characters/testCharacter/debug_player.tscn"
	playerTwo = "res://characters/testCharacter/debug_player.tscn"

func get_player(player):
	if player == 1:
		return playerOne
	if player == 2:
		return playerTwo
