extends Node


func pickup(player:Node):
	player.modifiers.damagedByExplosions = false
	
func restart(player:Node):
	pickup(player)
