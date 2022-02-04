extends Control
class_name DynamicTooltip

func _init(text:String, key:int):
	$Container/Label.text = text
	$Container/IconContainer/Sprite.frame = key
