extends Node2D
onready var player = owner.get_node("Player")
onready var event = owner.get_node('GlobalEventManager')
	
func setgun(args):
	var selected = args[1].to_int()
#			print(selected)
	player.data.selectedGun = selected
	player.updateGun()
	event.emit_signal("messageEntered", "Console", "Switched weapon")

func hello(args):
	event.emit_signal("messageEntered", "Console", "Hey @%s!" % player.data.name)

func setname(args):
	var selected = args[1]
	player.data.name = selected
	event.emit_signal("messageEntered", "Console", "Switched name to " + selected)
	
func reset(args):
	player.data = player.baseData
	event.emit_signal("messageEntered", "Console", "Reset all data")
	player.updateGun()

var helpPages = {
		"guns": {
			"title": "List of guns",
			"description": "0: SMG\n1: Pistol\n2: Shotgun\n3: Rocket Launcher\n4: Rifle\n5: Pyros Gun (available only with cheats)",
		}
	}
var commands = {
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
	"setname": {
		"description": "Sets your name",
		"args": 1,
		"cheat": false
	},
	"reset": {
		"description": "Resets your character permanently",
		"args": 0,
		"cheat": false
	},
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
	print(args)
	if text.begins_with('/'):
		if has_method(args[0].replace("/", "")):
			call(args[0].replace("/", ""), args)
		else:
			event.emit_signal("messageEntered", "Console", "[color=red]No command found.[/color]")
