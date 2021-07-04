extends Node
var Inventoryitems = []
onready var InventoryUI = get_tree().get_nodes_in_group("InventoryUI")[0]
onready var Player = get_tree().get_nodes_in_group("Player")[0]




func Inventoryitems():
	Inventoryitems = []

func sword():
	Inventoryitems.append("Sword")
	print(Inventoryitems)
	
func axe():
	Inventoryitems.append("Axe")
	print(Inventoryitems)
	
func _ready():
	InventoryUI.get_node("HBoxContainer/HB1/Outside1").hide()
	InventoryUI.get_node("HBoxContainer/HB2/Outside2").hide()
	InventoryUI.get_node("HBoxContainer/HB3/Outside3").hide()
	InventoryUI.get_node("HBoxContainer/HB4/Outside4").hide()
	InventoryUI.get_node("HBoxContainer/HB5/Outside5").hide()
	

func _process(delta):
	if "Sword" in Inventoryitems:
		InventoryUI.get_node("HBoxContainer/HB1/Sword").show()
	if "Axe" in Inventoryitems:
		InventoryUI.get_node("HBoxContainer/HB2/Axe").show()
	
	
	
	
	if Input.is_action_pressed("slot_1"):
		InventoryUI.get_node("HBoxContainer/HB2/Outside2").hide()
		InventoryUI.get_node("HBoxContainer/HB3/Outside3").hide()
		InventoryUI.get_node("HBoxContainer/HB4/Outside4").hide()
		InventoryUI.get_node("HBoxContainer/HB5/Outside5").hide()
		
		#Hide other items
		Player.get_node("Axe").hide()
		
		
		#Show the slots and item
		InventoryUI.get_node("HBoxContainer/HB1/Outside1").show()
#		var slotactive1 = true
	if "Sword" in Inventory.Inventoryitems and Input.is_action_pressed("slot_1"):
		Player.get_node("Sword").show()
		
		#DROP ITEM
	if "Sword" in Inventory.Inventoryitems and Input.is_action_pressed("Drop"):
		print("DROP")
		Inventoryitems.remove("Sword")
		Player.get_node("Sword").hide()
		InventoryUI.get_node("HBoxContainer/HB1/Sword").hide()



	if Input.is_action_pressed("slot_2"):
		if "Axe" in Inventoryitems:
			InventoryUI.get_node("HBoxContainer/HB2/Axe").show()
		
		InventoryUI.get_node("HBoxContainer/HB3/Outside3").hide()
		InventoryUI.get_node("HBoxContainer/HB1/Outside1").hide()
		InventoryUI.get_node("HBoxContainer/HB4/Outside4").hide()
		InventoryUI.get_node("HBoxContainer/HB5/Outside5").hide()
		
		#Hide other items
		Player.get_node("Sword").hide()
		
		#Show the slots and item
		InventoryUI.get_node("HBoxContainer/HB2/Outside2").show()
#		var slotactive2 = true
	if "Axe" in Inventory.Inventoryitems and Input.is_action_pressed("slot_2"):
		Player.get_node("Axe").show()
		
		#DROP ITEM
	if "Axe" in Inventory.Inventoryitems and Input.is_action_pressed("Drop"):
		print("DROP")
		Inventoryitems.remove("Axe")
		Player.get_node("Axe").hide()
		InventoryUI.get_node("HBoxContainer/HB2/Axe").hide()



	if Input.is_action_pressed("slot_3"):
		#Hide slots
		InventoryUI.get_node("HBoxContainer/HB1/Outside1").hide()
		InventoryUI.get_node("HBoxContainer/HB2/Outside2").hide()
		InventoryUI.get_node("HBoxContainer/HB4/Outside4").hide()
		InventoryUI.get_node("HBoxContainer/HB5/Outside5").hide()
		
		#Hide other items
		Player.get_node("Sword").hide()
		Player.get_node("Axe").hide()
		
		#Show the slots and item
		InventoryUI.get_node("HBoxContainer/HB3/Outside3").show()




	if Input.is_action_pressed("slot_4"):
		#Hide slots
		InventoryUI.get_node("HBoxContainer/HB1/Outside1").hide()
		InventoryUI.get_node("HBoxContainer/HB2/Outside2").hide()
		InventoryUI.get_node("HBoxContainer/HB3/Outside3").hide()
		InventoryUI.get_node("HBoxContainer/HB5/Outside5").hide()
		
		#Hide other items
		Player.get_node("Sword").hide()
		Player.get_node("Axe").hide()
		
		#Show the slots and item
		InventoryUI.get_node("HBoxContainer/HB4/Outside4").show()




	if Input.is_action_pressed("slot_5"):
		#Hide slots
		InventoryUI.get_node("HBoxContainer/HB1/Outside1").hide()
		InventoryUI.get_node("HBoxContainer/HB2/Outside2").hide()
		InventoryUI.get_node("HBoxContainer/HB3/Outside3").hide()
		InventoryUI.get_node("HBoxContainer/HB4/Outside4").hide()
		
		#Hide other items
		Player.get_node("Sword").hide()
		Player.get_node("Axe").hide()
		
		#Show the slots and item
		InventoryUI.get_node("HBoxContainer/HB5/Outside5").show()
