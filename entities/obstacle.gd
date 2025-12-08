extends Node3D

func _ready():
	pass
	
func _process(delta: float) -> void:
	#Faz o obstaculo se mover em direção ao jogador
	var speed : float = Global.global_speed
	position.z += speed * delta
	


#Sistema de colisão com o player
func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		Global.global_speed = 0.0
		
		body.is_dead = true
		body.get_node("AnimationPlayer").play("animations/fall")
		
		#verificando o record
		if Global.distance > Global.best_distance:
			Global.best_distance = Global.distance
			Global.save_best_distance()
		
		
		await get_tree().create_timer(1.5).timeout
		get_tree().change_scene_to_file("res://shared/game_over.tscn")


func _on_visible_on_screen_notifier_3d_screen_exited() -> void:
	queue_free()
