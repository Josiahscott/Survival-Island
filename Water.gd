extends Area
var bodies
var player = null
var interact_text = "Press E to pick up Drink"
onready var InventoryUI = get_tree().get_nodes_in_group("InventoryUI")[0]
func _process(delta):
	if player!= null:
		if Input.is_action_just_pressed("use"):
			print("Pick up Drink")
			queue_free()
			InventoryUI.Inventoryitems.append("Water")
		
func _on_Area_body_entered(body):
	if body.is_in_group("Player"):
		print("adding player")
		player = body
		

func _on_Area_body_exited(body):
	if body.is_in_group("Player"):
		print("player leaving")
		player = null
