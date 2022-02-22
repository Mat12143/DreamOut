extends Node
class_name NetworkSyncer, "res://sprites/Icons/NetworkSyncer.svg"

# Made by Tesohh (Simone Tesini) from Pyros.
# Created for Dreamout (dreamout.pyros.dev)
# Checkout my stuff: pyros.dev

export (PoolStringArray) var syncedProperties # Variables to sync
export (bool) var unreliable = false # Determines if the rset should be unreliable or not

puppet var puppets = {}
var masters = {}

func _ready():
	pass

func _process(delta):
	if is_network_master():
		for i in syncedProperties:
			masters[i] = owner[i]
		if (unreliable): rset_unreliable("puppets", masters)
		else: rset("puppets", masters)
		
	else:
		for i in syncedProperties:
			if puppets.has(i):
				owner[i] = puppets[i]
#			else:
#				print_debug("Tried to access unexistant property " + i)
