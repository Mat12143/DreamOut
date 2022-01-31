extends Node

# Obbligatori
export (int, "Passive", "Consumable") var type = 0
#onready var sprite:StreamTexture = preload("res://sprites/Bullets/orange.png")
export var id:String
export var _name:String

# Opzionali
export (int, "D", "C", "B", "A", "S") var quality = 0
export var popup:String = "Picked up"
export (String, MULTILINE) var lore = "This item has no lore."

func _enter_tree():
	if (_name == ""):
		print_debug("ITEM HAS NO NAME!!!!!!")
		_name = "GenericItem"
	if (id == ""):
		print_debug("ITEM HAS NO ID!!!!!!")
		id = String(randi())
#	if id != "template":
#		get_tree().current_scene.get_node("ItemDB").items[id] = self

