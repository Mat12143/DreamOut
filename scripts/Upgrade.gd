extends Area2D

export (String, "projSpeed", "charSpeed", "fireRate", "damage") var key
export (int) var value = 1
export (String) var itemName = "Upgrade"

var humanReadables = {
	"projSpeed": "[color=blue]Velocity[/color]",
	"charSpeed": "[color=green]Agility[/color]",
	"fireRate": "[color=yellow]Dexterity[/color]",
	"damage": "[color=red]Power[/color]"
}
#export (float) var spawnChance # Questo poi servira' a MAT FORSE FORSE FORSE
#export (bool) var forceQuality = false
#export (int, "common", "nice", "good", "crazy") var forcedQuality = 0
#
#enum {
#	COMMON,
#	NICE,
#	GOOD,
#	CRAZY
#}
#var quality

#func _ready():
#	if !forceQuality:
#		randomize()
#		var bag := RNGTools.WeightedBag.new()
#		bag.weights = {
#				COMMON: 60,
#				NICE: 25,
#				GOOD: 10,
#				CRAZY: 5,
#		}
#		quality = RNGTools.pick_weighted(bag)
#	else:
#		quality = forcedQuality
#	value *= quality + 1
var toTweenOrNotToTween = true
func _on_Module_body_entered(body: Node):
	if (body.is_in_group("Player")):
		get_tree().get_current_scene().get_node("GlobalEventManager").emit_signal("upgradePickedUp", key, value)
		get_tree().get_current_scene().get_node("GlobalEventManager").emit_signal("popupText", itemName, humanReadables[key] + " UP")
		$Tween.interpolate_property(
			self, "modulate", Color('ffffff'), Color('00ffffff'), 0.3
		)
		if (toTweenOrNotToTween):
			$Tween.start()
		toTweenOrNotToTween = false
#		queue_free()


func _on_Tween_tween_completed(object, key):
	queue_free()
#	pass
