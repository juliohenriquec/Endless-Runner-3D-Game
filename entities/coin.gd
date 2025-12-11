extends Node3D

const ROT_SPEED : float = 2.0
@export var hud : CanvasLayer
@export var ground : Node3D 



func _process(delta: float) -> void:
	#rotação no proprio eixo
	rotate_y(deg_to_rad(ROT_SPEED))
	#Faz o obstaculo se mover em direção ao jogador
	var speed : float = Global.global_speed
	position.z += speed * delta


#Sistema de colisão com o player
func _on_area_3d_body_entered(_body: Node3D) -> void:
	Global.coins += 1
	queue_free()

#Despawn de moedas
func _on_visible_on_screen_notifier_3d_screen_exited() -> void:
	queue_free()
	
