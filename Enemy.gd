extends KinematicBody
#enemy variables
export var speed = 30
var health = 100 #enemy health
var shoot = null
var target = null #target for player is null on start up
var velocity = Vector3.ZERO
var shoot_timer : Timer
onready var player = owner.get_node("Player")
#onready var shoottimer = $ShootTimer
onready var raycast = $RayCast
onready var runanim = $Body/Run #loading variables
onready var spearanim = $Body/Spear
var gravity = 1 #gravity


func _physics_process(delta):
	
	var fps = Performance.get_monitor(Performance.TIME_FPS)
	
	if target: 
		#moving to target + spear animation when throwing spear
		look_at(target.global_transform.origin, Vector3.UP)
		rotation.x = 0
		rotation.z = 0
		move_to_target(delta)
		if shoot_timer.is_stopped():
			spearanim.play("CharatersThrowSpear")
			print("HIT!")
			PlayerStats.change_health(-5)
			shoot_timer.start()


	
	var player_distance = translation.distance_to(player.translation)
	if player_distance < 2.5:
		target = player #targeting player
	else:
		target = null #no longer targeting player
		#RUN IDLE
		

	velocity.y -= gravity *delta #gravity
	velocity = move_and_slide(velocity, Vector3.UP,true)

func _on_Area2_body_entered(body): #player entering area of body and damaging player
	if body.is_in_group("Player"):
		PlayerStats.change_health(0)

func move_to_target(delta): #moving to the player
	runanim.play("CharatersRun")
	var direction = (target.transform.origin - transform.origin).normalized()
	move_and_slide(direction * speed * delta, Vector3.UP)


func _process(delta):
	if health <= 0:
		queue_free() #dying when health <= 0



func _ready(): #shooting spear timer
	shoot_timer = Timer.new()
	self.add_child(shoot_timer)
	shoot_timer.wait_time = 5
	shoot_timer.one_shot = true
