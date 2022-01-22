extends Node2D

signal playerHit
signal upgradePickedUp
signal messageEntered


func _on_GlobalEventManager_upgradePickedUp(key, value):
	print({
		"youSelected": key,
		"howMuch": value
	})


func _on_GlobalEventManager_messageEntered(author, text):
	get_tree().current_scene.get_node("HUD/ChatBox/VBoxContainer/ChatLog").bbcode_text += "\n[%s] %s" % [author, text]
