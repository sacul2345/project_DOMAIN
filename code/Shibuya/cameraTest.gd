extends Camera3D

@export var SPEED : int = 5
@export var OFFSET : int

var Player
var Distance
var Direction

func _ready():
	Player = $"../Player"

func _process(delta):
	Distance = position.z - Player.position.z
	
	position.z = ((Distance / 2) * -1) + OFFSET
