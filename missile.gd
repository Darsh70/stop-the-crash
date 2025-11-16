extends CharacterBody2D


const SPEED = 300.0


func _ready():
	$AnimatedSprite2D.play("idle")
	set_physics_process(false)
	

func _physics_process(delta: float) -> void:
	if is_physics_processing():
		velocity.y -= SPEED * delta
	move_and_slide()

func prepare():
	$AnimatedSprite2D.play("preparing")

func launch():
	$AnimatedSprite2D.play("launched")
	set_physics_process(true)
