extends Control
class_name DynamicTooltip

func initialize(text:String, key:String):
	$Label.bbcode_text = "[%s] %s" %[key.to_upper(), text]
	$Label.rect_size = $Label.get_font("font").get_string_size($Label.bbcode_text)
#	$Container/IconContainer/Sprite.frame = key
