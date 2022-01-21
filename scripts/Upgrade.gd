extends Area2D

export (String, "projSpeed", "charSpeed", "fireRate", "damage") var key
export (int) var value = 1
export (float) var spawnChance # Questo poi servira' a MAT FORSE FORSE FORSE
export (bool) var forceQuality = false
export (int, "common", "nice", "good", "crazy") var forcedQuality = 0

enum {
	COMMON,
	NICE,
	GOOD,
	CRAZY
}
var quality

func _ready():
	if !forceQuality:
		randomize()
		var bag := RNGTools.WeightedBag.new()
		bag.weights = {
				COMMON: 60,
				NICE: 25,
				GOOD: 10,
				CRAZY: 5,
		}
		quality = RNGTools.pick_weighted(bag)
	else:
		quality = forcedQuality
	value *= quality + 1

func _on_Module_body_entered(body: Node):
	if (body.is_in_group("Player")):
		get_tree().get_current_scene().get_node("GlobalEventManager").emit_signal("upgradePickedUp", key, value)
