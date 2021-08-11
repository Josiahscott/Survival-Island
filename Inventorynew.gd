extends Node
var Inventoryitems = []
onready var InventoryUI = get_tree().get_nodes_in_group("InventoryUI")[0]
onready var Player = get_tree().get_nodes_in_group("Player")[0]
var Inventory

var slotactive1 = false
var slotactive2 = false
var slotactive3 = false
var slotactive4 = false
var slotactive5 = false

func Inventoryitems():
	Inventoryitems = []

func sword():
	Inventoryitems.append("Sword")
	print(Inventoryitems)
	
func axe():
	Inventoryitems.append("Axe")
	print(Inventoryitems)

func water():
	Inventoryitems.append("Water")
	print(Inventoryitems)
	
func apple():
	Inventoryitems.append("Apple")
	print(Inventoryitems)
	
func spear():
	Inventoryitems.append("Spear")
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
	if "Water" in Inventoryitems:
		InventoryUI.get_node("HBoxContainer/HB5/Water").show()
	if "Apple" in Inventoryitems:
		InventoryUI.get_node("HBoxContainer/HB4/Apple").show()
	if "Spear" in Inventoryitems:
		InventoryUI.get_node("HBoxContainer/HB3/Spear").show()
	
	
	if Input.is_action_pressed("slot_1"):
		InventoryUI.get_node("HBoxContainer/HB2/Outside2").hide()
		InventoryUI.get_node("HBoxContainer/HB3/Outside3").hide()
		InventoryUI.get_node("HBoxContainer/HB4/Outside4").hide()
		InventoryUI.get_node("HBoxContainer/HB5/Outside5").hide()
		
		#Hide other items
		Player.get_node("Axe").hide()
		Player.get_node("Water").hide()
		Player.get_node("Apple").hide()
		Player.get_node("Spear").hide()
		slotactive2 = false
		slotactive3 = false
		slotactive4 = false
		slotactive5 = false
		
		#Show the slots and item
		InventoryUI.get_node("HBoxContainer/HB1/Outside1").show()
		slotactive1 = true
	if "Sword" in Inventory.Inventoryitems and Input.is_action_pressed("slot_1"):
		Player.get_node("Sword").show()
		
		#DROP ITEM
	if "Sword" in Inventory.Inventoryitems and Input.is_action_pressed("Drop") and slotactive1 == true:
		print("DROP")
		Inventoryitems.remove("Sword")
		Player.get_node("Sword").hide()
		InventoryUI.get_node("HBoxContainer/HB1/Sword").hide()
		
		#USE ITEM
	if slotactive1 and "Sword" in Inventory.Inventoryitems and Input.is_action_pressed("left_click"):
		Player.swordhit()

	if Input.is_action_pressed("slot_2"):
		if "Axe" in Inventoryitems:
			InventoryUI.get_node("HBoxContainer/HB2/Axe").show()
		
		InventoryUI.get_node("HBoxContainer/HB3/Outside3").hide()
		InventoryUI.get_node("HBoxContainer/HB1/Outside1").hide()
		InventoryUI.get_node("HBoxContainer/HB4/Outside4").hide()
		InventoryUI.get_node("HBoxContainer/HB5/Outside5").hide()
		
		#Hide other items
		Player.get_node("Sword").hide()
		Player.get_node("Water").hide()
		Player.get_node("Apple").hide()
		Player.get_node("Spear").hide()
		slotactive1 = false
		slotactive3 = false
		slotactive4 = false
		slotactive2 = false
		#Show the slots and item
		InventoryUI.get_node("HBoxContainer/HB2/Outside2").show()
		slotactive2 = true
	if "Axe" in Inventory.Inventoryitems and Input.is_action_pressed("slot_2"):
		Player.get_node("Axe").show()
		
		#DROP ITEM
	if "Axe" in Inventory.Inventoryitems and Input.is_action_pressed("Drop") and slotactive2 == true:
		print("DROP")
		Inventoryitems.remove("Axe")
		Player.get_node("Axe").hide()
		InventoryUI.get_node("HBoxContainer/HB2/Axe").hide()
		#USE ITEM
	if slotactive2 and "Axe" in Inventory.Inventoryitems and Input.is_action_pressed("left_click"):
		Player.axehit()


	if Input.is_action_pressed("slot_3"):
		if "Spear" in Inventoryitems:
			InventoryUI.get_node("HBoxContainer/HB3/Spear").show()
		#Hide slots
		InventoryUI.get_node("HBoxContainer/HB1/Outside1").hide()
		InventoryUI.get_node("HBoxContainer/HB2/Outside2").hide()
		InventoryUI.get_node("HBoxContainer/HB4/Outside4").hide()
		InventoryUI.get_node("HBoxContainer/HB5/Outside5").hide()
		
		#Hide other items
		#Hide other items
		Player.get_node("Sword").hide()
		Player.get_node("Axe").hide()
		Player.get_node("Apple").hide()
		Player.get_node("Water").hide()
		slotactive1 = false
		slotactive2 = false
		slotactive4 = false
		slotactive5 = false
		#Show the slots and item
		InventoryUI.get_node("HBoxContainer/HB3/Outside3").show()
		slotactive3 = true
	if "Spear" in Inventory.Inventoryitems and Input.is_action_pressed("slot_3"):
		Player.get_node("Spear").show()
		
		#DROP ITEM
	if "Spear" in Inventory.Inventoryitems and Input.is_action_pressed("Drop") and slotactive3 == true:
		print("DROP")
		Inventoryitems.remove("Spear")
		Player.get_node("Spear").hide()
		InventoryUI.get_node("HBoxContainer/HB3/Spear").hide()
		#USE ITEM
	if slotactive3 and "Spear" in Inventory.Inventoryitems and Input.is_action_pressed("left_click"):
		Player.spearhit()



	if Input.is_action_pressed("slot_4"):
		if "Apple" in Inventoryitems:
			InventoryUI.get_node("HBoxContainer/HB4/Apple").show()
		#Hide slots
		InventoryUI.get_node("HBoxContainer/HB1/Outside1").hide()
		InventoryUI.get_node("HBoxContainer/HB2/Outside2").hide()
		InventoryUI.get_node("HBoxContainer/HB3/Outside3").hide()
		InventoryUI.get_node("HBoxContainer/HB5/Outside5").hide()
		
		#Hide other items
		#Hide other items
		Player.get_node("Sword").hide()
		Player.get_node("Axe").hide()
		Player.get_node("Water").hide()
		Player.get_node("Spear").hide()
		slotactive1 = false
		slotactive2 = false
		slotactive3 = false
		slotactive5 = false
		#Show the slots and item
		InventoryUI.get_node("HBoxContainer/HB4/Outside4").show()
		slotactive4 = true
	if "Apple" in Inventory.Inventoryitems and Input.is_action_pressed("slot_4"):
		Player.get_node("Apple").show()
		
		#DROP ITEM
	if "Apple" in Inventory.Inventoryitems and Input.is_action_pressed("Drop") and slotactive4 == true:
		print("DROP")
		Inventoryitems.remove("Apple")
		Player.get_node("Apple").hide()
		InventoryUI.get_node("HBoxContainer/HB4/Apple").hide()
		#USE ITEM
	if slotactive4 and "Apple" in Inventory.Inventoryitems and Input.is_action_pressed("use"):
		print("Eat")
		PlayerStats.change_food(75)
		Inventoryitems.remove("Apple")
		Player.get_node("Apple").hide()
		InventoryUI.get_node("HBoxContainer/HB4/Apple").hide()
		



	if Input.is_action_pressed("slot_5"):
		if "Water" in Inventoryitems:
			InventoryUI.get_node("HBoxContainer/HB5/Water").show()
		#Hide slots
		InventoryUI.get_node("HBoxContainer/HB1/Outside1").hide()
		InventoryUI.get_node("HBoxContainer/HB2/Outside2").hide()
		InventoryUI.get_node("HBoxContainer/HB3/Outside3").hide()
		InventoryUI.get_node("HBoxContainer/HB4/Outside4").hide()
		
		#Hide other items
		#Hide other items
		Player.get_node("Sword").hide()
		Player.get_node("Axe").hide()
		Player.get_node("Apple").hide()
		Player.get_node("Spear").hide()
		slotactive1 = false
		slotactive2 = false
		slotactive3 = false
		slotactive4 = false
		#Show the slots and item
		InventoryUI.get_node("HBoxContainer/HB5/Outside5").show()
		slotactive5 = true
	if "Water" in Inventory.Inventoryitems and Input.is_action_pressed("slot_5"):
		Player.get_node("Water").show()
		
		#DROP ITEM
	if "Water" in Inventory.Inventoryitems and Input.is_action_pressed("Drop") and slotactive5 == true:
		print("DROP")
		Inventoryitems.remove("Water")
		Player.get_node("Water").hide()
		InventoryUI.get_node("HBoxContainer/HB5/Water").hide()
		#USE ITEM
	if slotactive5 and "Water" in Inventory.Inventoryitems and Input.is_action_pressed("use"):
		print("Drink")
		PlayerStats.change_water(50)
		Inventoryitems.remove("Water")
		Player.get_node("Water").hide()
		InventoryUI.get_node("HBoxContainer/HB5/Water").hide()
		
