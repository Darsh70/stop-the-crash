extends Node2D

@export var missile_scene: PackedScene
@export var start_position = Vector2(-100,0)
@export var spacing = Vector2(100,0)

var missiles = []
var next_index = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var missile1 = missile_scene.instantiate()
	var missile2 = missile_scene.instantiate()
	var missile3 = missile_scene.instantiate()
	var missile4 = missile_scene.instantiate()
	
	missile1.position = start_position 
	missile2.position = start_position + spacing
	missile3.position = start_position + 2 * spacing
	missile4.position = start_position + 3 * spacing
	
	missiles.append(missile1)
	missiles.append(missile2)
	missiles.append(missile3)
	missiles.append(missile4)
	
	add_child(missile1)
	add_child(missile2)
	add_child(missile3)
	add_child(missile4)


func launch_next():
	if next_index >= missiles.size():
		print("NO MORE MISSILES")
		return
	var m = missiles[next_index]
	m.prepare()
	
	await get_tree().create_timer(2).timeout
	m.launch()
	
	next_index += 1
