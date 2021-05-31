extends KinematicBody

var target

func _process(delta):
	if target:
		look_at(target.global_transform.origin, Vector3.UP)

func _on_Area_body_entered(body):
	print(body.name + "entered")
	if body.is_in_group("Player"):
		target = body


func _on_Area_body_exited(body):
	print(body.name + "exited")
	if body.is_in_group("Player"):
		target = null

func _on_Area2_body_entered(body):
	if body.is_in_group("Player"):
		PlayerStats.change_health(-5)

#https://www.youtube.com/watch?v=OSYehj6oa3U&t=1109s&ab_channel=UnchartedTerritoriesUnchartedTerritories
