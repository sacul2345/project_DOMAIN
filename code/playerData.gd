extends Node3D

@export var playerOneHealth = 100
@export var playerTwoHealth = 100

signal sendDataScript

var playerOne
var playerTwo

var playersLoaded = false

func _player_loaded(player): # 'player' is either an int 0 or 1 to specify player one or player two
	if player == 0:
		playerOne = get_child(0).get_child(0)    # these things get the player container node based off of the 'player' parameter
		print("loaded player " , player + 1 , ": " ,playerOne)
	if player == 1:
		playerTwo = get_child(1).get_child(0)
		print("loaded player " , player + 1 , ": " ,playerTwo)
	
	if playerOne != null && playerTwo != null:
		sendDataScript.emit(self)
		
func _ready():
	pass

func _process(_delta):    
	if playersLoaded == false:      #this checks if both players are loaded before trying to assign variables
		if playerOne != null && playerTwo != null:
			playersLoaded = true
	if playersLoaded:
		pass
