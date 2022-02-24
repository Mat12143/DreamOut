extends Node

# Remote -> Esegue tutti i client tranne chi la chiama
# Remotesync -> Tutti i Client
# is_network_master() controlla se sei l'owner del client
# get_tree().is_network_server() controlla l'host
# rpc_unreliable()

remote func Funzione(ciao1):
	
	print(ciao1)
	

func _ready():
	
	ciao1 = "a"

	rpc_id(name, "Funzione", ciao1)


remotesync func provaFunc():
	pass

