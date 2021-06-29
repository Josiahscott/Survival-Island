extends Container

func _ready():
	$Itemtest.hide()

func _process(delta):
	if "Sword" in Inventory.Inventoryitems:
		$Itemtest.show()
 # WOULD NEED TO ADD THIS CODE TO PLAYER CODE 
