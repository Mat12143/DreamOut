extends YSort


func _ready():
	randomize()
	var titles = [
		"Test",
		"Capybaras are always valid",
		"Giuro",
		"pyros",
		"Ok lets go"
	]
	OS.set_window_title("Gioco Pazzo: %s!" % RNGTools.pick(titles))
