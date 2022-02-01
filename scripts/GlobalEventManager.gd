extends Node2D

signal playerHit
signal playerHeal(value)
signal upgradePickedUp
signal messageEntered(author, text)
signal popupText(title, subtitle)
signal shake(duration, frequency, amplitude, priority)
signal roomEnter(roomData)
onready var startPopupPos = get_tree().current_scene.get_node('HUD/PopupText').rect_position

func _on_GlobalEventManager_messageEntered(author:String, text:String):
	var chatBox = get_tree().current_scene.get_node("HUD/ChatBox/VBoxContainer/ChatLog")
	var player = owner.get_node("Player")
	text = text.strip_edges()
	if (text.begins_with('/')):
		pass
	else:
		var newText = "\n[color=grey][%s][/color] %s" % [author, text]
		chatBox.bbcode_text += newText.replace("@%s" % player.data.name, "[color=blue]@%s[/color]" % player.data.name) # TAGGG
	get_tree().current_scene.get_node("HUD/ChatBox/VBoxContainer/ChatSweeper").start(10)
	chatBox.show()
	


func _on_GlobalEventManager_popupText(title, subtitle):
	var popup = get_tree().current_scene.get_node('HUD/PopupText')
	var tween:Tween = popup.get_node("Tween")
	popup.show()
	tween.interpolate_property(popup, "rect_position",
				Vector2(0, 0), Vector2(0, -100), 0.2,
				Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	popup.get_node("Title").bbcode_text = "[center]" + title + "[/center]"
	popup.get_node("Subtitle").bbcode_text =  "[center]" + subtitle + "[/center]"
	yield(get_tree().create_timer(2), "timeout")
	tween.start()
	
func _on_Tween_tween_completed(object, key):
	var popup = get_tree().current_scene.get_node('HUD/PopupText')
	popup.hide()
	popup.rect_position = startPopupPos

func _on_GlobalEventManager_shake(duration, frequency, amplitude, priority):
	pass # Replace with function body.
