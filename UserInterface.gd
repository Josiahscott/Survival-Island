extends Control

func _ready():
	$HealthBar.max_value = PlayerStats.health_max
	$FoodBar.max_value = PlayerStats.health_max
	$WaterBar.max_value = PlayerStats.health_max
	
func _process(delta):
	$HealthBar.value = PlayerStats.get_health()
	$FoodBar.value = PlayerStats.get_health()
	$WaterBar.value = PlayerStats.get_health()
