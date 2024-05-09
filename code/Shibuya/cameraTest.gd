extends Camera3D

@export var SPEED : int = 10
@export var OFFSET : int

var Player
var Distance
var Direction

#func _ready():
	#Player = $"../Player"

#func _physics_process(delta):
	#Distance = position.z - Player.position.z
	#position.z = ((((Distance / 2) * -1) * SPEED) * delta) + OFFSET
