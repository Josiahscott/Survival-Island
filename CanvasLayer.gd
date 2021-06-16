extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	$MarginContainer/CenterContainer/Label.text = PlayerStats.get_text_display()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
