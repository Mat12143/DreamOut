extends Node

var items = {}

func get_files(path):
		var files = []
		var dir = Directory.new()
		dir.open(path)
		dir.list_dir_begin(true)

		var file = dir.get_next()
		while file != '':
			if file.ends_with(".tscn"):
				files += [file]
				file = dir.get_next()
		dir.list_dir_end()
		return files

func _ready():
	for i in get_files("res://items/items"):
		var item = load("res://items/items/" + i).instance()
		items[item.id] = item
		
