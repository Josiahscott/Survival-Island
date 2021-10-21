extends Node
#variable stats
var health
var health_max
var food
var food_max
var water
var water_max
var score = 0

var text_display = ""

func _ready(): #sets stats to 100 (max)
	health = 100
	health_max = 100
	food = 100
	food_max = 100
	water = 100
	water_max = 100


#changes in stats due to player activity
func change_health(amount):
	health += amount
	health = clamp(health,0, health_max)
	
func change_food(amount):
	food += amount
	food = clamp(food,0, food_max)
	
func change_water(amount):
	water += amount
	water = clamp(water,0, water_max)


func get_health():
	return health
	


func get_food():
	return food

func get_water():
	return water

func get_text_display():
	return text_display
