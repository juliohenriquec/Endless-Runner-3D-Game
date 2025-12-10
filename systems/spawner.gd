extends Node3D

@export var obstacle_scene: PackedScene  = load("res://entities/obstacle.tscn")
@export var coin_scene: PackedScene = load("res://entities/coin.tscn")
@export var spawn_z_position: float = 40.0
@export var spawn_interval: float = 1.2

const LANES := [-2.0, 0.0, 2.0]

var max_side_by_side := 3
var min_spawn_interval : float = 0.4
var spawn_difficulty_factor : float = 0.97
var obstacle_chance := 0.6
var timer := 0.0
var min_coin_chance := 0.25


func _ready() -> void:
	Global.connect("difficulty_increase", Callable(self, "increase_difficulty"))

func _process(delta: float) -> void:
	Global.distance += Global.global_speed * delta
	timer -= delta
	
	if timer <= 0:
		spawn_random_object()
		timer = spawn_interval

func spawn_random_object():
	var group_size := 1
	var r := randf()
	
	if r < 0.5:
		group_size = 1
	elif r < 0.95:
		group_size = 2
	else:
		group_size = 3
	
	# Em dificuldades menores: poucos grupos grandes
	group_size = clamp(group_size, 1, max_side_by_side)
	
	# Em cada posição permitida na pista
	var copy_lanes = LANES.duplicate()
	
	copy_lanes.shuffle()
	
	for i in range(group_size):
		var lane = copy_lanes[i]
		var instance
		
		if randf() < obstacle_chance:
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
	obstacle_chance = min(obstacle_chance + 0.03, 1.0 - min_coin_chance)
	
	#DEBUG
	print("Nova velocidade:", Global.global_speed)
	print("Novo spawn interval:", spawn_interval)
	print("Chance obstáculo:", obstacle_chance)
