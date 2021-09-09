extends Control
 

func _process(delta):
	if Input.is_action_pressed("esc"):
		get_tree().quit()

func _on_Play_pressed():
	print("PLAY")
	get_tree().change_scene("res://World.tscn")

func _on_Controls_pressed():
	pass # Replace with function body.

func _on_Exit_pressed():
	get_tree().quit()
