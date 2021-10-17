extends KinematicBody

var torch = false #torch is disabled
var sword_damage = 20
var axe_damage = 50 #item damages
var spear_damage = 10
onready var torch_item = $torch 
onready var hitbox = get_node("hitbox") #loading variables 
onready var blood_splatter = preload("res://Blood.tscn")
var sword_timer : Timer
var axe_timer : Timer #timers for using items
var spear_timer : Timer
var torch_timer : Timer

var speed = 0.3
var acceleration = 10
var gravity = 0.02 #player movement
var jump = 1.2
var mouse_sensitivity = 0.2

var direction = Vector3()
var velocity = Vector3()
var fall = Vector3()  #player gravitiy and movement (with some help from online because of glitches)
var vvel = Vector3()
var inertia
var prev_pos
onready var ray = $Head/InteractRay
onready var head = $Head
onready var gc = $GroundCast 
onready var swordhitanim = $SwordHit #loading animations
onready var axehitanim = $axeswing
onready var spearhitanim = $Spearhit

#Using items code and affect on the enemie + animations
func swordhit():
	if sword_timer.is_stopped():
		swordhitanim.play("Sword")
		sword_timer.start()
		for body in hitbox.get_overlapping_bodies():
			if body.is_in_group("Enemy"):
				var b = blood_splatter.instance()
				b.global_transform = global_transform
				get_parent().add_child(b)
				b.set_emitting(true)
				body.health -= sword_damage
	else:
		pass
#Using items code and affect on the enemie + animations
func axehit():
	if axe_timer.is_stopped():
		axehitanim.play("axeswing_anim")
		axe_timer.start()
		for body in hitbox.get_overlapping_bodies():
			if body.is_in_group("Enemy"):
				var b = blood_splatter.instance()
				b.global_transform = global_transform
				get_parent().add_child(b)
				b.set_emitting(true)
				body.health -= axe_damage
	else:
		pass
#Using items code and affect on the enemie + animations
func spearhit():
	if spear_timer.is_stopped():
		spearhitanim.play("Spear")
		spear_timer.start()
		for body in hitbox.get_overlapping_bodies():
			if body.is_in_group("Enemy"):
				var b = blood_splatter.instance()
				b.global_transform = global_transform
				get_parent().add_child(b)
				b.set_emitting(true)
				body.health -= spear_damage
	else:
		pass

func _ready():
	#timers for using items
	sword_timer = Timer.new()
	self.add_child(sword_timer)
	sword_timer.wait_time = 0.5
	sword_timer.one_shot = true
	
	axe_timer = Timer.new()
	self.add_child(axe_timer)
	axe_timer.wait_time = 1.2
	axe_timer.one_shot = true
	
	spear_timer = Timer.new()
	self.add_child(spear_timer)
	spear_timer.wait_time = 0.2
	spear_timer.one_shot = true

	torch_timer = Timer.new()
	self.add_child(torch_timer)
	torch_timer.wait_time = 0.5
	torch_timer.one_shot = true

	$Sword.hide()
	$Axe.hide()
	$Water.hide()
	$Apple.hide() #hiding items by default on game start up
	$Spear.hide()
	$Torch.hide()
	prev_pos = global_transform.origin

	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) #making mouse dissapear 
	
	
func _input(event):
	
	if event is InputEventMouseMotion:
		rotate_y(deg2rad(-event.relative.x * mouse_sensitivity)) 
		head.rotate_x(deg2rad(-event.relative.y * mouse_sensitivity))  #mouse movement code
		head.rotation.x = clamp(head.rotation.x, deg2rad(-90), deg2rad(90))

func check_ray():
	if ray.is_colliding():
		var body = ray.get_collider().get_parent()
		if body.is_in_group("Interactable"):
			PlayerStats.text_display = body.interact_text
	else:
		PlayerStats.text_display = ""

func _physics_process(delta):
#movement code
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
		PlayerStats.change_health(-0.001)  #changing stats while sprinting
	if PlayerStats.get_water() >= 0:
		PlayerStats.change_water(-0.0001)
	if PlayerStats.get_food() >= 0:
		PlayerStats.change_food(-0.0001)
	if PlayerStats.get_food() > 95:
		PlayerStats.change_health(0.004)
	
	
	if int(PlayerStats.get_health()) <= 20:
		pass #RED BLOOD USERINTERFACE
	if int(PlayerStats.get_health()) <= 0:
		get_tree().change_scene("res://Death.tscn")
		
	
	#gravity
	inertia = (prev_pos - global_transform.origin).length() * fps / speed 
	direction = direction.normalized() * speed
	direction += direction * (1.5 - inertia) 
	direction.y = vvel.y 
	
	if not is_on_floor():
		vvel.y -= gravity
	else:
		vvel.y = -0.1
	#jumping
	if Input.is_action_just_pressed("jump") and is_on_floor():
		vvel.y = jump
		move_and_slide(vvel, Vector3.UP) 
	
	prev_pos = global_transform.origin
	
	move_and_slide_with_snap(direction, Vector3.DOWN, Vector3.UP, true, 7, 0.8) 
#using the torch
	if Input.is_action_just_pressed("torch"):
		if torch == false:
			torch = true
			$Torch.show()
		elif torch == true:
			torch = false
			$Torch.hide()
			
#quitting the game
func _process(delta):
	if Input.is_action_pressed("esc"):
		get_tree().quit()
