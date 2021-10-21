extends Control

#sets the stat bars to max
func _ready():
	$HealthBar.max_value = PlayerStats.health_max
	$FoodBar.max_value = PlayerStats.food_max
	$WaterBar.max_value = PlayerStats.water_max

func _process(delta):
	$HealthBar.value = PlayerStats.get_health()
	$FoodBar.value = PlayerStats.get_food()
	$WaterBar.value = PlayerStats.get_water()
	$FoodBar.max_value = PlayerStats.health_max
	$WaterBar.max_value = PlayerStats.health_max

