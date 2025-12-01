extends CharacterBody3D


const SPEED: float = 8.0
const JUMP_VELOCITY:float = 8
const GRAVITY: float = 24.0
const LANES: Array = [-2, 0, 2] #Posição das pistas de corrida index = 0,1,2

var starting_point: Vector3 = Vector3.ZERO
var current_lane: int = 1 #Inicia na posição 1 do array lanes (x = 0)
var target_lane: int = 1

var is_jumping: bool = false
var is_dead: bool = false

func _ready() -> void:
	starting_point =global_transform.origin

func _physics_process(delta: float) -> void:
	var direction: Vector3 = Vector3.ZERO
	
	#Trocando de pista
	if Input.is_action_just_pressed("ui_left") and target_lane > 0:
		target_lane -= 1
	if Input.is_action_just_pressed("ui_right") and target_lane < LANES.size() -1 :
		target_lane += 1
		
	#Movendo na direção da pista de destino.
	var target_x: float = LANES[target_lane]
	var current_x: float = global_transform.origin.x
	global_transform.origin.x = lerp(current_x, target_x, SPEED * delta)
	
	#Gravidade
	if not is_on_floor():
		velocity.y -= GRAVITY * delta
	else:
		velocity.y = 0 
	
	#pulo
	if is_on_floor() and Input.is_action_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY
	
	move_and_slide()
