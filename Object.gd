extends Area
var bodies
var player = null
var interact_text = "Press E to Drink"

func _process(delta):
	if player!= null:
		if Input.is_action_just_pressed("use"):
			print("Drink")
			PlayerStats.change_water(10)
		
func _on_Area_body_entered(body):
	if body.is_in_group("Player"):
		print("adding player")
		player = body
