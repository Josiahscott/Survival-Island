extends Node
var Inventoryitems = []
onready var InventoryUI = get_tree().get_nodes_in_group("InventoryUI")[0]
onready var Player = get_tree().get_nodes_in_group("Player")[0]

var slotactive1 = false




func Inventoryitems():
	Inventoryitems = []

func sword():
	Inventoryitems.append("Sword")
#	Inventory.remove("null")
	print(Inventoryitems)
	
func _ready():
	InventoryUI.get_node("HBoxContainer/HB1/Outside1").hide()
	InventoryUI.get_node("HBoxContainer/HB2/Outside2").hide()
	InventoryUI.get_node("HBoxContainer/HB3/Outside3").hide()
	InventoryUI.get_node("HBoxContainer/HB4/Outside4").hide()
	InventoryUI.get_node("HBoxContainer/HB5/Outside5").hide()
	
func _process(delta):
	if "Sword" in Inventory.Inventoryitems:
		InventoryUI.get_node("HBoxContainer/HB1/Itemtest").show()
	
	
	if Input.is_action_pressed("slot_1"):
		InventoryUI.get_node("HBoxContainer/HB2/Outside2").hide()
		InventoryUI.get_node("HBoxContainer/HB3/Outside3").hide()
		InventoryUI.get_node("HBoxContainer/HB4/Outside4").hide()
		InventoryUI.get_node("HBoxContainer/HB5/Outside5").hide()
		
		#Hide other items
		
		#Show the slots and item
		InventoryUI.get_node("HBoxContainer/HB1/Outside1").show()
		var slotactive1 = true
	if "Sword" in Inventory.Inventoryitems and Input.is_action_pressed("slot_1"):
		Player.get_node("Sword").show()
		
		#DROP ITEM
	if "Sword" in Inventory.Inventoryitems and Input.is_action_pressed("Drop") and slotactive1 == true:
		print("DROP")
		Player.get_node("Sword").hide()
		InventoryUI.get_node("HBoxContainer/HB1/Itemtest").hide()



	if Input.is_action_pressed("slot_2"):
		#Hide slots
		InventoryUI.get_node("HBoxContainer/HB3/Outside3").hide()
		InventoryUI.get_node("HBoxContainer/HB1/Outside1").hide()
		InventoryUI.get_node("HBoxContainer/HB4/Outside4").hide()
		InventoryUI.get_node("HBoxContainer/HB5/Outside5").hide()
		
		#Hide other items
		Player.get_node("Sword").hide()
		
		#Show the slots and item
		InventoryUI.get_node("HBoxContainer/HB2/Outside2").show()




	if Input.is_action_pressed("slot_3"):
		#Hide slots
		InventoryUI.get_node("HBoxContainer/HB1/Outside1").hide()
		InventoryUI.get_node("HBoxContainer/HB2/Outside2").hide()
		InventoryUI.get_node("HBoxContainer/HB4/Outside4").hide()
		InventoryUI.get_node("HBoxContainer/HB5/Outside5").hide()
		
		#Hide other items
		Player.get_node("Sword").hide()
		
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
		
		#Show the slots and item
		InventoryUI.get_node("HBoxContainer/HB5/Outside5").show()
