extends Node


func pickup(player):
	player.data.upgrades.accuracy = 1000
	player.data.upgrades.gunRange = 1000

func restart(player):
	pass
