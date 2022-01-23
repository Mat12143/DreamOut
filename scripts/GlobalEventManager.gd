extends Node2D

signal playerHit
signal upgradePickedUp
signal messageEntered(author, text)
signal popupText(title, subtitle)
onready var startPopupPos = get_tree().current_scene.get_node('HUD/PopupText').rect_position


func _on_GlobalEventManager_upgradePickedUp(key, value):
	print({
		"youSelected": key,
		"howMuch": value
	})

func _on_GlobalEventManager_messageEntered(author:String, text:String):
	var chatBox = get_tree().current_scene.get_node("HUD/ChatBox/VBoxContainer/ChatLog")
	var player = owner.get_node("Player")
	text = text.strip_edges()
	if (text.begins_with('/')):
		if text.begins_with('/setgun'):
			var selected = text.replace("/setgun ", "").to_int()
#			print(selected)
			player.data.selectedGun = selected
			player.updateGun()
			emit_signal("messageEntered", "Console", "Switched weapon")
			
		elif text.begins_with('/hello'):
			emit_signal("messageEntered", "Console", "Hey @%s!" % player.data.name)
			
		elif text.begins_with('/name'):
			var selected = text.replace("/name ", "").strip_edges()
			player.data.name = selected
			emit_signal("messageEntered", "Console", "Switched name to " + selected)
			
		elif text.begins_with('/reset'):
			player.data = player.baseData
			emit_signal("messageEntered", "Console", "Reset all data")
			player.updateGun()
			
		
		elif text.begins_with("/help"):
			var selected = text.replace("/help ", "").strip_edges()
			print(selected)
			var helpColors = {
				"cheat": "red",
				"info": "blue",
				"command": "purple"
			}
			var helpPages = {
				"setgun": {
					"title": "/setgun",
					"type": "cheat",
					"text": "Changes your weapon.\nInput any number to get the corresponding weapon",
				},
				"guns": {
					"title": "List of guns",
					"type": "info",
					"text": "0: SMG\n1: Pistol\n2: Shotgun\n3: Rocket Launcher\n4: Rifle\n5: Pyros Gun (available only with cheats)"
				},
				"/help": {
					"title": "/help",
					"type": "command",
					"text": "Input /help + the name of the command or something you want to know more about"
				}
			}
			if !helpPages.has(selected):
				emit_signal("messageEntered", "Help", "[color=red]No help page found[/color]")
				return
			var page = helpPages[selected]
			emit_signal(
				"messageEntered", 
				"Help", 
				"[color=green]%s[/color] %s\n%s" % [page.title, "[color=%s]%s[/color]" % [helpColors[page.type], page.type.to_upper()], page.text])
		else:
			emit_signal("messageEntered", "Console", "[color=red]No command found.[/color]")
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
