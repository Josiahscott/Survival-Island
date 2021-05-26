extends Node

var health
var health_max
var food
var food_max
var water
var water_max

func _ready():
	health = 100
	health_max = 100
	food = 100
	food_max = 100
	water = 100
	water_max = 100

func change_health(amount):
	health += amount
	health = clamp(health,0, health_max)
	
func change_food(amount):
	food += amount
	food = clamp(food,0, food_max)
	
func change_water(amount):
	water += amount
	water = clamp(water,0, water)

func get_health():
	return health

func get_food():
	return food

func get_water():
	return water
