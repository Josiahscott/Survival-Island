extends KinematicBody

export var speed = 30
var health = 100
var shoot = null
var target = null
var velocity = Vector3.ZERO
var shoot_timer : Timer
onready var player = owner.get_node("Player")
onready var shoottimer = $ShootTimer
onready var raycast = $RayCast

var gravity = 0


func _physics_process(delta):
	
	var fps = Performance.get_monitor(Performance.TIME_FPS)
	
	if target: 
		#RUN ANIMATION
		look_at(target.global_transform.origin, Vector3.UP)
		rotation.x = 0
		rotation.z = 0
		move_to_target(delta)
		if shoot_timer.is_stopped():
			#RUN ANIMATION
			print("HIT!")
			PlayerStats.change_health(-5)
			shoot_timer.start()


		
	var player_distance = translation.distance_to(player.translation)
	if player_distance < 2.5:
		target = player
	else:
		target = null
		#RUN IDLE
		

	velocity.y -= gravity *delta
	velocity = move_and_slide(velocity, Vector3.UP)

func _on_Area2_body_entered(body):
	if body.is_in_group("Player"):
		PlayerStats.change_health(-12)

func move_to_target(delta):
	var direction = (target.transform.origin - transform.origin).normalized()
	move_and_slide(direction * speed * delta, Vector3.UP)
	#RAY CAST IF NOT ON GORUND


func _process(delta):
	if health <= 0:
		queue_free()


func _ready():
	shoot_timer = Timer.new()
	self.add_child(shoot_timer)
	shoot_timer.wait_time = 3
	shoot_timer.one_shot = true

