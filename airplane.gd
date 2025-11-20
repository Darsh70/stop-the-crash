extends CharacterBody2D

const SPEED = 35.0
var direction = -1

var stage = {1: "stage_1", 2: "stage_2", 3: "stage_3", 4: "stage_4"}
var current_stage = 0
func _physics_process(_delta: float) -> void:
	velocity.x = direction * SPEED
	move_and_slide()

	# Always check before accessing collision 0
	if get_slide_collision_count() > 0:
		var collision = get_slide_collision(0)
		var collider = collision.get_collider()
		collider.explode()
		$CPUParticles2D.emitting = true
		current_stage += 1
		$AnimatedSprite2D.play(stage[current_stage])
