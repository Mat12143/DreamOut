extends Node2D
var player
onready var event = owner.get_node('GlobalEventManager')
var whisperLastRecipient

func inject(newPlayer):
	player = newPlayer
	
func w(args:Array):
	if !!whisperLastRecipient and args.size() < 2:
		event.emit_signal("messageEntered", "Console", "[color=red]Please type a message.[/color]", {"whisperRecipient": player.name})			
	elif !whisperLastRecipient and args.size() < 3:
		event.emit_signal("messageEntered", "Console", "[color=red]Please type the name of the recipient and a message.[/color]", {"whisperRecipient": player.name})
	
	var recipient	
	for k in Network.players.keys():
		var v = Network.players[k]
		if v.name == args[1]:
			recipient = k
	
	if !!whisperLastRecipient:
		recipient = whisperLastRecipient
	
	print(recipient, args)
	
	if !!recipient:
		args.remove(1)
		whisperLastRecipient = recipient
		event.emit_signal("messageEntered", player.data.name + "-> You", args.slice(2, args.size()), {"whisperRecipient": recipient})
	else:
		event.emit_signal("messageEntered", "Console", "[color=red]No recipient found.[/color]", {"whisperRecipient": player.name})

func toggleshake(args):
	player.data.settings.screenShake = !player.data.settings.screenShake
	event.emit_signal("messageEntered", "Console", "Toggled screenshake")	

func dev(args):
	player.data.dev = !player.data.dev
	event.emit_signal("messageEntered", "Console", "Toggled dev mode bro.....")	

func givemebombs(args):
	player.data.bombs = 100
	event.emit_signal("messageEntered", "Console", "Ay homie here\'s some bombs")	

func setgun(args):
	var selected = args[1].to_int()
#			print(selected)
	player.data.selectedGun = selected
	player.rpc("updateGun")
	event.emit_signal("messageEntered", "Console", "Switched weapon")

func hello(args):
	event.emit_signal("messageEntered", "Console", "Hey @%s!" % player.data.name)

func setname(args):
	var selected = args[1]
	player.data.name = selected
	event.emit_signal("messageEntered", "Console", "Switched name to " + selected)

func setlang(args):
	var selected = args[1]
	if !(selected in TranslationServer.get_loaded_locales()):
		event.emit_signal("messageEntered", "Console", "[color=red]That locale doesn't exist. Valid locales: " + String(TranslationServer.get_loaded_locales()) + "[/color]")
		return
	else:
		TranslationServer.set_locale(selected)
		event.emit_signal("messageEntered", "Console", "Set language to " + selected)
#	TranslationServer.set_locale()

func reset(args):
	player.data = player.baseData
	event.emit_signal("messageEntered", "Console", "Reset all data")
	player.updateGun()

func heal(args):
	player.data.health = player.maxHealth + player.data.upgrades.maxHealth
	event.emit_signal("messageEntered", "Console", "Fully healed")
	event.emit_signal("playerHit", 0, player.name)

func damage(args):
#	player.data.health = player.maxHealth + player.data.upgrades.maxHealth
	var damageToDeal = 0.5
	if args.size() > 1:
		damageToDeal = float(args[1])
	event.emit_signal("playerHit", damageToDeal, player.name, "magic")
	event.emit_signal("messageEntered", "Console", "Damaged you")

func zoom(args):
	var zoomPercent = (1 / (float(args[1]) / 100))
	get_tree().current_scene.get_node("Camera2D").zoom = Vector2(zoomPercent, zoomPercent)

var commands = {
	"zoom": {
		"description": "Sets camera zoom. Only for devs",\
		"args": 1,
		"cheat": true,
		"devOnly": true
	},
	"setgun": {
		"description": "Sets your gun",
		"helpDesc": "Sets your gun. To see a list of numbers for the guns, run /help guns",
		"args": 1,
		"cheat": true
	},
	"hello": {
		"description": "Greets you",
		"args": 0,
		"cheat": false
	},
	"help": {
		"description": "Shows this page",
		"args": 0,
		"cheat": false
	},
	"setname": {
		"description": "Sets your name",
		"args": 1,
		"cheat": false
	},
	"reset": {
		"description": "Resets your character",
		"args": 0,
		"cheat": false
	},
	"dev": {
		"description": "Toggles DEV mode",
		"args": 0,
		"cheat": true
	},
	"givemebombs": {
		"description": "Gives you 100 bombs",
		"args": 0,
		"cheat": true
	},
	"heal": {
		"description": "Fully heals you",
		"args": 0,
		"cheat": true
	},
	"damage": {
		"description": "Damages you for 0.5",
		"args": 0,
		"cheat": true
	},
	"toggleshake": {
		"description": "Toggles screen shake",
		"args": 0,
		"cheat": false
	},
	"w": {
		"description": "Send a private message to a player",
		"args": 2,
		"cheat": false
	},
}

var helpPages = {
		"guns": {
			"title": "List of guns",
			"description": "0: SMG\n1: Pistol\n2: Shotgun\n3: Rocket Launcher\n4: Rifle\n5: Pyros Gun (available only with cheats)",
		}
	}

func help(args:PoolStringArray):
	if args.size() == 1:
		var commandString = 'List of commands\n'
		var sortedCommands: Array = commands.keys()
		sortedCommands.sort()
#		sortedCommands = sortedCommands.sort()
#		print(sortedCommands)
		for k in sortedCommands:
			var v = commands[k]
			commandString += "%s [color=grey](%s)[/color] %s\n" % [k, v.description, "[color=red]CHEAT[/color]" if v.cheat else ""]
		event.emit_signal("messageEntered", "Help", commandString)
	else:
		var selected = args[1]
		var helpColors = {
			"cheat": "red",
			"info": "blue",
			"command": "purple"
		}
			
		if !helpPages.has(selected) and !commands.has(selected):
			event.emit_signal("messageEntered", "Help", "[color=red]No help page found[/color]")
			return
		var page
		if helpPages.has(selected):
			page = helpPages[selected]
			page.type = "info"
		else:
			page = commands[selected]
			page.title = '/' + selected
			page.type = 'command' if !page.cheat else 'cheat'
			page.additional = "[color=grey]%s arguments[/color]" % String(page.args)
		event.emit_signal(
			"messageEntered", 
			"Help", 
			"[color=green]%s[/color] %s\n%s%s" % [page.title, "[color=%s]%s[/color]" % [helpColors[page.type], page.type.to_upper()], page.helpDesc if page.has('helpDesc') else page.description, "" if !page.has("additional") else "\n" + page.additional])

func _on_GlobalEventManager_messageEntered(author, text:String):
	text = text.strip_edges()
	var args = text.split(" ")
#	print(args)
	if text.begins_with('/'):
		if has_method(args[0].replace("/", "")):
			if commands[args[0].replace("/", "")].cheat and !get_tree().is_network_server():
				event.emit_signal("messageEntered", "Console", "[color=red]Only admins can use this command[/color]", {"whisperRecipient": player.name})
				return
			if commands[args[0].replace("/", "")].has("devOnly") and commands[args[0].replace("/", "")].devOnly and !player.data.dev:
				event.emit_signal("messageEntered", "Console", "[color=red]Only developers can use this command[/color]", {"whisperRecipient": player.name})
			call(args[0].replace("/", ""), args)
		else:
			event.emit_signal("messageEntered", "Console", "[color=red]No command found.[/color]", {"whisperRecipient": player.name})
		
