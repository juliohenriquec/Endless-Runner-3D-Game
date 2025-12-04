extends Node3D


func _process(delta: float) -> void:
	#Faz o obstaculo se mover em direção ao jogador
	var speed : float = Global.global_speed
	position.z += speed * delta


#Sistema de colisão com o player
func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		Global.global_speed = 0.0
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://shared/game_over.tscn")
