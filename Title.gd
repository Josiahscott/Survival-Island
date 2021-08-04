extends Control

var Userinterface = get_tree().get_nodes_in_group("Userinterface")
var title = get_tree().get_nodes_in_group("title")
var player = get_tree().get_nodes_in_group("Player")

func _ready():
	Userinterface.hide()
	player.hide()

func _on_Play_pressed():
	title.hide()
	Userinterface.show()

func _on_Controls_pressed():
	pass # Replace with function body.

func _on_Exit_pressed():
	get_tree().quit()
