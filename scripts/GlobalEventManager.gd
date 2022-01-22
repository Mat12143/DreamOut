extends Node2D

signal playerHit
signal upgradePickedUp
signal messageEntered(author, text)


func _on_GlobalEventManager_upgradePickedUp(key, value):
	print({
		"youSelected": key,
		"howMuch": value
	})

func _on_GlobalEventManager_messageEntered(author:String, text:String):
	get_tree().current_scene.get_node("HUD/ChatBox/VBoxContainer/ChatLog").bbcode_text += "\n[color=grey][%s][/color] %s" % [author, text]
	if (text.begins_with('/')):
			if text.begins_with('/weapon'):
				var selected = text.replace("/weapon ", "").to_int()
#				print(['giuro', selected])
				owner.get_node("Player").data.selectedGun = selected
				owner.get_node("Player").updateGun()
				emit_signal("messageEntered", "Console", "Switched weapon")
