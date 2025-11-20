extends CharacterBody2D


const SPEED = 300.0


func _ready():
	set_physics_process(false)
	

func _physics_process(delta: float) -> void:
	if is_physics_processing():
		velocity.y -= SPEED * delta
	move_and_slide()


func prepare():
	$PrepareLaunchParticles.emitting = true
	launch_after_delay()
	

func launch_after_delay():
	await get_tree().create_timer(0.5).timeout
	launch()
	
	
func launch():
	$CPUParticles2D.emitting = true
	$PrepareLaunchParticles.emitting = false
	set_physics_process(true)
	
func explode():
	queue_free()
