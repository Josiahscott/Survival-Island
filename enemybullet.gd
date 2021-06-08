extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var bullet_speed = 14
var direction

# Called when the node enters the scene tree for the first time.
func _ready():
	direction = get_parent().get_node("Player").global_transform.origin
	direction.y += 1
	look_at(direction,Vector3.UP)
	
#	var bullet_pos = global_transform.origin
#	direction = player_pos - bullet_pos
#	direction = direction.normalized()
	$ARROW/AnimationPlayer.play("Cube040Action")
	
func _process(delta):
	translate(Vector3.FORWARD * bullet_speed * delta)


func _on_Area_body_entered(body):
	if body.filename != "res://Enemyskelly.tscn":
		queue_free()

