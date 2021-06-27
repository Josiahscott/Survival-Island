extends Node

export (Array) var Inventory = [null,null,null,null,null];

func sword():
	Inventory.append("Sword")
	Inventory.remove("null")
	print(Inventory)
