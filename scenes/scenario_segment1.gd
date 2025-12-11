extends Node3D

@export var length : float = 40.0  # comprimento do segmento

func _process(delta):
	position.z -= Global.global_speed * delta
	
	if position.z > length:
		position.z += length * 5  # teleporta para frente (3 segmentos)
