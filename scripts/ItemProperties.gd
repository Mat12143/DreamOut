extends Node

# Obbligatori
export (int, "Passive", "Consumable") var type = 0
#onready var sprite:StreamTexture = preload("res://sprites/Bullets/orange.png")
export var id:String
onready var ilGozzo = tr(id).split("\n")
onready var _name:String = ilGozzo[0]

# Opzionali
export (int, "D", "C", "B", "A", "S") var quality = 0
onready var popup:String = "Picked up" if ilGozzo.size() < 2 else ilGozzo[1]
onready var lore = "This item has no lore." if ilGozzo.size() < 3 else ilGozzo[2]

func _ready():
	if (_name == ""):
		print_debug("ITEM HAS NO NAME!!!!!!")
		_name = "NoName"
	if (id == ""):
		print_debug("ITEM HAS NO ID!!!!!!")
		id = String(randi())
#	if id != "template":
#		get_tree().current_scene.get_node("ItemDB").items[id] = self

