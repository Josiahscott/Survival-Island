extends KinematicBody

export var speed = 100
var target

func _physics_process(delta):
	if target:
		look_at(target.global_transform.origin, Vector3.UP)
		rotation.x = 0
		rotation.z = 0
		move_to_target(delta)

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


func move_to_target(delta):
	var direction = (target.transform.origin - transform.origin).normalized()
	move_and_slide(direction * speed * delta, Vector3.UP)


#https://www.youtube.com/watch?v=Y_2oiLjOx54&ab_channel=CodewithTomCodewithTom
