extends Node2D


func _ready():
	randomize()
	var titles = [
		"Capybaras are always valid",
		"Giuro",
		"pyros",
		"Ok lets go",
		"Avoid PHP at all costs",
		"Look mother, I am a hat",
		"No autoclickers allowed",
		"Officina Tecnologica",
		"John China",
		"Imagine using joomla...",
		"Hilarious",
		"Godot Engine"
	]
	OS.set_window_title("Gioco Pazzo: %s!" % RNGTools.pick(titles))
