extends Node2D

signal playerHit
signal upgradePickedUp


func _on_GlobalEventManager_upgradePickedUp(key, value):
	print({
		"youSelected": key,
		"howMuch": value
	})
