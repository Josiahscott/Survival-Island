extends KinematicBody

var speed = 1
var acceleration = 10
var gravity = 0.08
var jump = 1.2

var mouse_sensitivity = 0.2

var direction = Vector3()
var velocity = Vector3()
var fall = Vector3() 
var vvel = Vector3()
var inertia
var prev_pos

onready var head = $Head
onready var gc = $GroundCast

func _ready():
	prev_pos = global_transform.origin

	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	
	if event is InputEventMouseMotion:
		rotate_y(deg2rad(-event.relative.x * mouse_sensitivity)) 
		head.rotate_x(deg2rad(-event.relative.y * mouse_sensitivity)) 
		head.rotation.x = clamp(head.rotation.x, deg2rad(-90), deg2rad(90))

func _physics_process(delta):
	
	var fps = Performance.get_monitor(Performance.TIME_FPS)
	
	direction = Vector3()
	
	if Input.is_action_pressed("move_forward"):
	
		direction -= transform.basis.z
	
	elif Input.is_action_pressed("move_backward"):
		
		direction += transform.basis.z
		
	if Input.is_action_pressed("move_left"):
		
		direction -= transform.basis.x			
		
	elif Input.is_action_pressed("move_right"):
		
		direction += transform.basis.x
	
	if Input.is_action_just_pressed("sprint"):
		speed = 1.5
	if Input.is_action_just_released("sprint"):
		speed = 1

	
	
	
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

func _on_Area_area_entered(area):
	if area.get_parent().filename == "":
		PlayerStats.change_health(-5)
		area.get_parent().queue_free()
