extends YSort


func _ready():
	randomize()
	var titles = [
		"Test",
		"Capybaras are always valid",
		"Giuro"
	]
	OS.set_window_title("Gioco Pazzo: %s!" % RNGTools.pick(titles))
