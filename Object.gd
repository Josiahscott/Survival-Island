extends Spatial


func _on_Area_body_entered(body):
	print(body.name + "entered box")
	if body.is_in_group("Player") and Input.is_action_pressed("use"):
		print("Drink")
		PlayerStats.change_water(10)
