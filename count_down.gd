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
	#$Timer.set_paused(true)
	if not $Timer1.text:
		$Timer1.text = str("%.2f" % current_time)
	elif not $Timer2.text:
		$Timer2.text = str("%.2f" % current_time)
	$MissileManager.launch_next()
	$Timer.start()

func _on_start_pressed() -> void:
	if $Timer.is_paused():
		$Timer.set_paused(false)
		
