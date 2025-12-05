extends Node

var coins := 0
var distance: float = 0.0

#velocidade do jogo
var uv_speed = 2
var global_speed: float = uv_speed * 10


var best_distance: float = 0.0

func _ready() -> void:
	load_best_distance()
	
	
func load_best_distance():
	var config := ConfigFile.new()
	var err := config.load("user://save.cfg")
	if err == OK:
		best_distance = config.get_value("score", "best_distance", 0.0)
	


func save_best_distance():
	var config := ConfigFile.new()
	config.set_value("score", "best_distance", best_distance)
	config.save("user://save.cfg")
