extends AnimatedSprite2D

var velocity = Vector2()
var speed = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play("idle")
	set_process(false)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_processing():
		velocity.y -= speed * delta
		position += velocity

func prepare():
	play("preparing")

func launched():
	play("launched")
	set_process(true)
	
	
