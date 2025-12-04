extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CoinsHud/CoinLabel.text = "0"
	$DistanceHud/DistanceLabel.text = "0"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$CoinsHud/CoinLabel.text = str(Global.coins)
	$DistanceHud/DistanceLabel.text = "%d m" % Global.distance
	pass
