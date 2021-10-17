extends CanvasLayer


#displaying margin container for player stats
func _process(delta):
	$MarginContainer/CenterContainer/Label.text = PlayerStats.get_text_display()

