extends Control
 

func _ready():
	if Input.is_action_pressed("move_left"):
		get_tree().quit()

func _on_Play_pressed():
	print("PLAY")

func _on_Controls_pressed():
	pass # Replace with function body.

func _on_Exit_pressed():
	if Input.is_action_pressed("move_left"):
		get_tree().quit()
