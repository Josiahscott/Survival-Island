extends Area
var bodies
var player = null
var interact_text = "Press E to Eat" #text to show up on screen

func _process(delta):
	if player!= null:
		if Input.is_action_just_pressed("use"): 
			print("Eat") #eating the food and chaning player stats
			PlayerStats.change_food(20)
		
func _on_Area_body_entered(body): #player entering area of campfire
	if body.is_in_group("Player"):
		print("adding player")
		player = body
		

func _on_Area_body_exited(body): #player leaving area of campfire
	if body.is_in_group("Player"):
		print("player leaving")
		player = null



