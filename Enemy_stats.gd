extends Node
#enemy health variables
var health
var health_max
#enemy health
func _ready():
	health = 100
	health_max = 100

#changing enemy health
func change_health(amount):
	health += amount
	health = clamp(health,0, health_max)
	
func get_health():
	return health

