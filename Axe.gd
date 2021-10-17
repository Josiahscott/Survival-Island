extends Area
var bodies
var player = null
var interact_text = "Press E to pick up Axe" #text to show up on screen
onready var InventoryUI = get_tree().get_nodes_in_group("InventoryUI")[0]

func _process(delta):
	if player!= null:
		if Input.is_action_just_pressed("use"):
			print("Pick up Axe") 
			queue_free() #player picking up and and adding to hotbar
			InventoryUI.Inventoryitems.append("Axe")
		
func _on_Area_body_entered(body): #player entering area of axe
	if body.is_in_group("Player"):
		print("adding player")
		player = body
		

func _on_Area_body_exited(body): #player leaving area of axe
	if body.is_in_group("Player"):
		print("player leaving")
		player = null
