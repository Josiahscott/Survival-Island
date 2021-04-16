extends KinematicBody

export var mouse_sensitivity = 0.3

var gravity = Vector3.DOWN * 12
var speed = 4
var jump_speed = 6

var velocity = Vector3()

func _physics_process(delta):
	velocity += gravity * delta
	get_input()
	velocity = move_and_slide(velocity, Vector3.UP)

func get_input():
	velocity.x = 0
	velocity.z = 0
	if Input.is_action_pressed("move_forward"):
		velocity.z -= speed
	if Input.is_action_pressed("move_backward"):
		velocity.z += speed
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
	if Input.is_action_pressed("move_right"):
		velocity.x += speed

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _input(event):
	if event is InputEventMouseMotion:
		print(event.get_relative())
		rotate_y(deg2rad(-event.get_relative().x) * mouse_sensitivity)
