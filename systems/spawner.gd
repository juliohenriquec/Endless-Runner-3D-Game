extends Node3D

@export var obstacle_scene: PackedScene  = load("res://entities/obstacle.tscn")
@export var coin_scene: PackedScene = load("res://entities/coin.tscn")
@export var spawn_z_position: float = 40.0
@export var spawn_interval: float = 1.2

const LANES := [-2.0, 0.0, 2.0]

var min_spawn_interval : float = 0.4
var spawn_difficulty_factor : float = 0.97
var obstacle_chance := 0.6
var timer := 0.0

func _ready() -> void:
	Global.connect("difficulty_increase", Callable(self, "increase_difficulty"))

func _process(delta: float) -> void:
	Global.distance += Global.global_speed * delta
	timer -= delta
	
	if timer <= 0:
		spawn_random_object()
		timer = spawn_interval

func spawn_random_object():
	var lane = LANES[randi() % LANES.size()]
	var is_obstacle = randf() < obstacle_chance
	var instance

	if is_obstacle:
		instance = obstacle_scene.instantiate()
	else:
		instance = coin_scene.instantiate()
	
	instance.position.x = lane
	instance.position.z = spawn_z_position
	
	add_child(instance)

func increase_difficulty():
	# aumentar velocidade do jogo
	Global.global_speed *= Global.speed_multiplier
	
	# diminuir intervalo do spawn
	spawn_interval *= spawn_difficulty_factor
	spawn_interval = max(spawn_interval, min_spawn_interval)
	
	# aumentar chance de obstáculo
	obstacle_chance = min(obstacle_chance + 0.03, 0.90)
	
	#DEBUG
	print("Nova velocidade:", Global.global_speed)
	print("Novo spawn interval:", spawn_interval)
	print("Chance obstáculo:", obstacle_chance)
