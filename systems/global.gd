extends Node

signal difficulty_increase

var coins : int = 0
var distance: float = 0.0

#velocidade do jogo
var uv_speed : int = 2
var global_speed: float = uv_speed * 10


var best_distance: float = 0.0

var difficulty_timer : float = 0.0
var difficulty_interval : float = 5.0
var speed_multiplier : float = 1.05


func _ready() -> void:
	load_best_distance()
	

func _process(delta: float) -> void:
	difficulty_timer += delta
	if difficulty_interval <= difficulty_timer:
		difficulty_timer = 0 
		emit_signal("difficulty_increase")


#instanciando o recorde
func load_best_distance():
	var config := ConfigFile.new()
	var err := config.load("user://save.cfg")
	if err == OK:
		best_distance = config.get_value("score", "best_distance", 0.0)
	

#salvando o recorde
func save_best_distance():
	var config := ConfigFile.new()
	config.set_value("score", "best_distance", best_distance)
	config.save("user://save.cfg")
