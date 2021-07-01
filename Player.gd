extends KinematicBody

var speed = 0.3
var acceleration = 10
var gravity = 0.02
var jump = 1.2

var mouse_sensitivity = 0.2

var direction = Vector3()
var velocity = Vector3()
var fall = Vector3() 
var vvel = Vector3()
var inertia
var prev_pos
onready var ray = $Head/InteractRay
onready var head = $Head
onready var gc = $GroundCast


func _ready():
	$Sword.hide()
	$Axe.hide()
	prev_pos = global_transform.origin

	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
#	if Input.is_action_pressed("escape"):
#		Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
	
func _input(event):
	
	if event is InputEventMouseMotion:
		rotate_y(deg2rad(-event.relative.x * mouse_sensitivity)) 
		head.rotate_x(deg2rad(-event.relative.y * mouse_sensitivity)) 
		head.rotation.x = clamp(head.rotation.x, deg2rad(-90), deg2rad(90))

func check_ray():
	if ray.is_colliding():
		var body = ray.get_collider().get_parent()
		if body.is_in_group("Interactable"):
			PlayerStats.text_display = body.interact_text
	else:
		PlayerStats.text_display = ""

func _physics_process(delta):
	check_ray()
	var fps = Performance.get_monitor(Performance.TIME_FPS)
	
	direction = Vector3()
	
	if Input.is_action_pressed("move_forward"):
		PlayerStats.change_water(-0.001)
		PlayerStats.change_food(-0.0003)
		direction -= transform.basis.z
	
	elif Input.is_action_pressed("move_backward"):
		PlayerStats.change_water(-0.001)
		PlayerStats.change_food(-0.0003)
		direction += transform.basis.z
		
	if Input.is_action_pressed("move_left"):
		
		direction -= transform.basis.x			
		
	elif Input.is_action_pressed("move_right"):
		
		direction += transform.basis.x
	if PlayerStats.water > 0 and PlayerStats.food > 0 and Input.is_action_just_pressed("sprint"):
		speed = 0.5
	if Input.is_action_just_released("sprint"):
		speed = 0.3
	if Input.is_action_pressed("sprint"):
		PlayerStats.change_water(-0.01)
		PlayerStats.change_food(-0.003)
	if PlayerStats.get_water() <= 0:
		PlayerStats.change_health(-0.001)
	if PlayerStats.get_food() > 95:
		PlayerStats.change_health(0.004)
	
	
	if int(PlayerStats.get_health()) <= 20:
		pass #RED BLOOD USERINTERFACE
	if int(PlayerStats.get_health()) <= 0:
		get_tree().change_scene("res://Death.tscn")
		
	
	
	inertia = (prev_pos - global_transform.origin).length() * fps / speed 
	direction = direction.normalized() * speed
	direction += direction * (1.5 - inertia)
	direction.y = vvel.y 
	
	if not is_on_floor():
		vvel.y -= gravity
	else:
		vvel.y = -0.1
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		vvel.y = jump
		move_and_slide(vvel, Vector3.UP) 
	
	prev_pos = global_transform.origin
	
	move_and_slide_with_snap(direction, Vector3.DOWN, Vector3.UP, true, 7, 0.8) 
	
	if Input.is_action_pressed("left_click"):
		pass
#		$AnimationPlayer.Play("")

	if Input.is_action_pressed("right_click"):
		pass
		
