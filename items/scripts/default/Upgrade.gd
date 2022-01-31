extends Node

export (String, "projSpeed", "charSpeed", "fireRate", "damage", "gunRange", "maxHealth") var key
export (int) var value = 1

var humanReadables = {
	"projSpeed": "[color=blue]Velocity[/color]",
	"charSpeed": "[color=green]Agility[/color]",
	"fireRate": "[color=yellow]Dexterity[/color]",
	"damage": "[color=red]Power[/color]",
	"gunRange": "[color=purple]Range[/color]",
	"maxHealth": "[color=red]Health[/color]"
}

func pickup(player:Node):
	get_tree().get_current_scene().get_node("GlobalEventManager").emit_signal("upgradePickedUp", key, value)
	get_tree().get_current_scene().get_node("GlobalEventManager").emit_signal("popupText", owner._name, humanReadables[key] + (" UP" if value > 0 else " DOWN"))

func restart(player):
	pass
