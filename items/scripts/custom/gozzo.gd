extends Node


func use(player:Node):
	get_tree().current_scene.get_node("GlobalEventManager").emit_signal("playerHit", 1)
	get_tree().get_current_scene().get_node("GlobalEventManager").emit_signal("upgradePickedUp", "maxHealth", 10)
func pickup(player:Node):
	pass

func restart(player:Node):
	pass
