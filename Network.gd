extends Node

# Credits to GDQuest

const DEFAULT_IP = '127.0.0.1'
const DEFAULT_PORT = 31400
const MAX_PLAYERS = 5

var players = { }
var self_data = { name = '', position = Vector2(222, 100), playerScene = load('res://scenes/Player.tscn').instance()  }

signal player_disconnected
signal server_disconnected

func _ready():
	get_tree().connect('network_peer_disconnected', self, '_on_player_disconnected')
	get_tree().connect('network_peer_connected', self, '_on_player_connected')

func create_server(player_nickname):
	self_data.name = player_nickname
#	self_data.playerScene =
	players[1] = self_data
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(DEFAULT_PORT, MAX_PLAYERS)
	get_tree().set_network_peer(peer)

func connect_to_server(player_nickname):
	self_data.name = player_nickname
	get_tree().connect('connected_to_server', self, '_connected_to_server')
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client(DEFAULT_IP, DEFAULT_PORT)
	get_tree().set_network_peer(peer)

func _connected_to_server():
	var local_player_id = get_tree().get_network_unique_id()
	players[local_player_id] = self_data
	rpc('_send_player_info', local_player_id, self_data)

func _on_player_disconnected(id):
	if id == 1:
		get_tree().network_peer = null
		get_tree().change_scene("res://ErrorScreen.tscn")
		get_tree().current_scene.get_node("TextChanger").changeText("ASD", "ASD")
	players.erase(id)

func _on_player_connected(connected_player_id):
	var local_player_id = get_tree().get_network_unique_id()
	if not(get_tree().is_network_server()):
		rpc_id(1, '_request_player_info', local_player_id, connected_player_id)

remote func _request_player_info(request_from_id, player_id):
	if get_tree().is_network_server():
		rpc_id(request_from_id, '_send_player_info', player_id, players[player_id])

# A function to be used if needed. The purpose is to request all players in the current session.
remote func _request_players(request_from_id):
	if get_tree().is_network_server():
		for peer_id in players:
			if( peer_id != request_from_id):
				rpc_id(request_from_id, '_send_player_info', peer_id, players[peer_id])

remote func _send_player_info(id, info):
	players[id] = info
	var new_player = load('res://scenes/Player.tscn').instance()
	new_player.name = str(id)
	new_player.set_network_master(id)
	players[id].playerScene = new_player
	new_player.init(info.name, info.position, true)
#	var label = Label.new()
	$'/root/TitleScreen/Actions'.refreshLobby() #.add_child_below_node($"/root/TitleScreen/Lobby/Title", label)
#	label.text = info.name
#	addToWorld(id)
	print(players)
	

func update_position(id, position):
	players[id].position = position

remote func addToWorld(id):
	$'/root/World/'.add_child(players[id].playerScene)
	

	
