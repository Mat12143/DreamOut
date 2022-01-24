extends Node2D
func pasciuto(giuro):
	print(giuro)
	
func _ready():
	call("pasciuto", "giuro giuro")

func _on_GlobalEventManager_messageEntered(author, text):
	var player = owner.get_node("Player")
	var event = owner.get_node('GlobalEventManager')
	text = text.strip_edges()
	if text.begins_with('/'):
		if text.begins_with('/setgun'):
			var selected = text.replace("/setgun ", "").to_int()
#			print(selected)
			player.data.selectedGun = selected
			player.updateGun()
			event.emit_signal("messageEntered", "Console", "Switched weapon")
			
		elif text.begins_with('/hello'):
			event.emit_signal("messageEntered", "Console", "Hey @%s!" % player.data.name)
			
		elif text.begins_with('/name'):
			var selected = text.replace("/name ", "").strip_edges()
			player.data.name = selected
			event.emit_signal("messageEntered", "Console", "Switched name to " + selected)
			
		elif text.begins_with('/reset'):
			player.data = player.baseData
			event.emit_signal("messageEntered", "Console", "Reset all data")
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
				event.emit_signal("messageEntered", "Help", "[color=red]No help page found[/color]")
				return
			var page = helpPages[selected]
			event.emit_signal(
				"messageEntered", 
				"Help", 
				"[color=green]%s[/color] %s\n%s" % [page.title, "[color=%s]%s[/color]" % [helpColors[page.type], page.type.to_upper()], page.text])
		else:
			event.emit_signal("messageEntered", "Console", "[color=red]No command found.[/color]")
