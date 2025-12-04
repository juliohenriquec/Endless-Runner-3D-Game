extends Node3D

@export var obstacle_scene: PackedScene  = load("res://entities/obstacle.tscn")
@export var coin_scene: PackedScene = load("res://entities/coin.tscn")

const LANES := [-2.0, 0.0, 2.0]

@export var spawn_z_position: float = 40.0
@export var spawn_interval: float = 1.2

var timer := 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Global.distance += Global.global_speed * delta
	timer -= delta
	if timer <= 0:
		spawn_random_object()
		timer = spawn_interval
		

func spawn_random_object():
	var lane = LANES[randi() % LANES.size()]
	
	var is_obstacle = randf() < 0.6
	var instance
	
	if is_obstacle:
		instance = obstacle_scene.instantiate()
	else:
		instance = coin_scene.instantiate()
		
	instance.position.x = lane
	instance.position.z = spawn_z_position
	instance.position.y = 0.3
	
	add_child(instance)
	
	
	
	
	
