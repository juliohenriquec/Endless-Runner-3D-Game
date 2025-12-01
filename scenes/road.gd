extends Node3D

signal chunk_passed

@export var player: CharacterBody3D
@export var speed :float = 10.0
@export var delete_distance : float = 10.0


func _physics_process(delta: float) -> void:
	if player == null:
		return 
		
	global_translate(Vector3(0,0, -speed * delta))
	
	if global_position.z < player.global_position.z - delete_distance:
		emit_signal("chunk_passed", self)
	
