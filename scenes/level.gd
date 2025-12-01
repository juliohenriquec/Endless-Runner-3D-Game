extends Node3D

@export var road_scene := preload("res://scenes/road.tscn")
@export var player :CharacterBody3D 

var chunk_length := 6.0
var chunks_loaded := 0
var chunck_in_front := 2
var next_spawn_z := -3.0

var road_spawnx: Array = [-2, 0, 2]

func _ready() -> void:
	for i in range(chunck_in_front + 1):
		_spawn_chunk()
		
		
func _spawn_chunk():
	var chunk = road_scene.instantiate()
	add_child(chunk)
	
	chunk.player = player
	print("player passado:", chunk.player)
	
	chunk.position = Vector3(0, 0, next_spawn_z)
	next_spawn_z -= chunk_length
	
	chunk.chunk_passed.connect(_on_chunk_passed)
	chunks_loaded += 1
	
func _on_chunk_passed(chunk):
	chunk.queue_free()
	chunks_loaded -= 1
	
	_spawn_chunk()
