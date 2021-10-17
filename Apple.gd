extends Area
var bodies
var player = null
var interact_text = "Press E to pick up Eat" #text to show up on screen
onready var InventoryUI = get_tree().get_nodes_in_group("InventoryUI")[0]
func _process(delta):
	if player!= null:
		if Input.is_action_just_pressed("use"):
			print("Pick up Eat") 
			queue_free() #eating the food and chaning player stats
			InventoryUI.Inventoryitems.append("Apple")
		
func _on_Area_body_entered(body): #player entering area of apple
	if body.is_in_group("Player"):
		print("adding player")
		player = body
		

func _on_Area_body_exited(body): #player leaving area of apple
	if body.is_in_group("Player"):
		print("player leaving")
		player = null
