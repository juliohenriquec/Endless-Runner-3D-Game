extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$BestDistanceLabel.text = "Recorde: %d m" % Global.best_distance
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	SoundManeger.stop_menu_music()
	Global.global_speed = Global.uv_speed * 10
	get_tree().change_scene_to_file("res://scenes/level.tscn")


func _on_button_2_pressed() -> void:
	get_tree().quit()
