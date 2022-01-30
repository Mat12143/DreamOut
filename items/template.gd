extends Node
class_name Item

enum Type {
	PASSIVE,
	ACTIVE,
}
enum Quality {
	D,
	C,
	B,
	A,
	S
}

# Obbligatori
var type:int
onready var sprite:StreamTexture = preload("res://sprites/Bullets/orange.png")
var id:String
var _name:String

# Opzionali
var quality:int
var popup:String
var lore:String


onready var player = get_tree().current_scene.get_node("Player")

func _constructor(type:int, sprite:StreamTexture, id:String, _name:String, quality:int, popup:String = "Yes", lore:String = "This item has no lore."):
	self.type = type
	self.sprite = sprite
	self.id = id
	self._name = _name
	self.quality = quality
	self.popup = popup
	self.lore = lore

func makeScene():
	# Viene usato per creare una scena, in caso l'oggetto si trova in una cassa (?)
	pass

func _ready():
	pass

func pickup():
	# Viene eseguito ogni volta che tiri su l'oggetto
	player.data.inventory.append()

func restart():
	# ogni riavvio del gioco se necessario
	pass
	
func use():
	# Viene eseguito quando l'oggetto viene usato (solo se ACTIVE)
	pass
