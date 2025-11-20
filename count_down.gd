extends CanvasLayer

var current_time
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	current_time = $Timer.time_left
	$Label.text = str("%.2f" % current_time)


func _on_pause_pressed() -> void:
	if not $Timer1.text:
		$Timer1.text = str("%.2f" % current_time)
	elif not $Timer2.text:
		$Timer2.text = str("%.2f" % current_time)
	elif not $Timer3.text:
		$Timer3.text = str("%.2f" % current_time)
	elif not $Timer4.text:
		$Timer4.text = str("%.2f" % current_time)
		$Pause.disabled = true
	$MissileManager.launch_next()
	$Timer.start()
