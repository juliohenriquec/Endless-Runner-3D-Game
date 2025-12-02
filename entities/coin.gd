extends Node3D

const ROT_SPEED := 2.0
@export var hud : CanvasLayer
@export var ground : Node3D 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate_y(deg_to_rad(ROT_SPEED))
	var speed : float = Global.global_speed
	position.z += speed * delta



func _on_area_3d_body_entered(body: Node3D) -> void:
	Global.coins += 1
	queue_free()
