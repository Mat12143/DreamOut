extends Control
class_name DynamicTooltip

onready var label = preload("res://scenes/UI/DynamicLabel.tscn")

func _ready():
	add_child(label.instance())

func initialize(text:String, key:int):
	$Label.bbcode_text = text
	$Label.rect_size = $Label.get_font("font").get_string_size($Label.bbcode_text)
#	$Container/IconContainer/Sprite.frame = key
