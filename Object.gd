extends Area
var bodies
var player = null
var interact_text = "Press E to Drink" #text to show up on screen

func _process(delta):
	if player!= null:
		if Input.is_action_just_pressed("use"):
			print("Drink") #drinking water
			PlayerStats.change_water(10)
		
func _on_Area_body_entered(body): #player entering the area
	if body.is_in_group("Player"):
		print("adding player")
		player = body
		

func _on_Area_body_exited(body): #player leaving the area
	if body.is_in_group("Player"):
		print("player leaving")
		player = null
