extends MeshInstance3D
#FUCK this code is a FUCKING MESS!!! WILL THESE LIGHTS LAG AND CRASH THE GAME?!?!? MAYBE! FUCK shits fucked
var light
var timer

func _ready():
	light = get_node("SpotLight3D")
	
func _on_flicker_lights():
	if(willLightFlicker()):
		flickerLights(flickerRandomNum())
	
func willLightFlicker():
	if randi_range(0,4) == 4:
		return false
	else:
		return true
		
func flickerRandomNum():
	return randi_range(1,100)
	
func flickerDuration():
	return randf_range(0.05,0.1)

func flickerAmmount():
	return randf_range(0.0,1.0)

func flickerLights(times):
	for i in times:    #how many times the light will flicker
		if willLightFlicker():    #will the light flicker?????
			await get_tree().create_timer(flickerDuration()).timeout
			light.set_param(0,flickerAmmount())
	light.set_param(0,8)

