extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play_menu_music()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func play_menu_music():
	$MusicMenu.play()
	
func stop_menu_music():
	$MusicMenu.stop()
	
func play_level_music():
	$MusicLevel.play()

func stop_level_music():
	$MusicLevel.stop()
