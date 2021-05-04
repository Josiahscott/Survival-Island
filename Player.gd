extends KinematicBody

#Physics
var moveSpeed : float = 5.0
var gravity = 9.8
var jump = 5
var capncrunch = Vector3()
#Camera lock
var minLookAngle : float = -90.0
var maxLookAngle : float = 90.0
var lookSensitivity : float = 10.0

#Vectors
var vel : Vector3 = Vector3()
var mouseDelta : Vector2 = Vector2()

#Components
onready var camera : Camera = get_node("Camera")
onready var meshinstance : Spatial = get_node("Camera/MeshInstance")

func _ready ():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta):
	vel.x = 0
	vel.y = 0
	
	var input = Vector2()
	
	#Movement inputs
	if Input.is_action_pressed("move_forward"):
		input.y -= 1
	if Input.is_action_pressed("move_backward"):
		input.y += 1
	if Input.is_action_pressed("move_left"):
		input.x -= 1
	if Input.is_action_pressed("move_right"):
		input.x += 1
		
	input = input.normalized()
	
	var forward = global_transform.basis.z
	var right = global_transform.basis.x
	
	var relativeDir = (forward * input.y + right * input.x)
	
	vel.x = relativeDir.x * moveSpeed
	vel.z = relativeDir.z * moveSpeed
	
	vel.y -= gravity * delta
	
	vel = move_and_slide(vel, Vector3.UP)
	
	if not is_on_floor():
		capncrunch.y -= gravity * delta
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		capncrunch.y = jump
		
	move_and_slide(capncrunch, Vector3.UP)
	
func _process(delta):
	
	camera.rotation_degrees.x -= mouseDelta.y * lookSensitivity * delta
	
	camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, minLookAngle, maxLookAngle)
	
	rotation_degrees.y -= mouseDelta.x * lookSensitivity * delta
	
	mouseDelta = Vector2()
	
func _input(event):
	
	if event is InputEventMouseMotion:
		mouseDelta = event.relative
		
