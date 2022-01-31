extends Node2D


func _ready():
	randomize()
	var titles = [
		"Capybaras are always valid",
		"made by pyros.dev",
		"Ok lets go",
		"Avoid PHP at all costs",
		"Look mother, I am a hat",
		"No autoclickers allowed",
		"Officina Tecnologica",
		"John China",
		"Imagine using joomla...",
		"Hilarious",
		"Godot Engine",
		"Hehehe HA",
		"What a giullare...",
		"Ole ole",
		"I swear",
		"Check out pyros.dev"
	]
	OS.set_window_title("Gioco Pazzo: %s!" % RNGTools.pick(titles))
