extends Control


# when esc is pressed the game in ended when on the death screen
func _process(delta):
	if Input.is_action_pressed("esc"):
		get_tree().quit()
