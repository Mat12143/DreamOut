extends VBoxContainer

var playerName = ""

func _ready():
	get_tree().connect('network_peer_connected', self, '_on_player_connected')
#	get_tree().connect('network_peer_disconnected', self, 'refreshLobby')
	
	var saveName = SaveManager.loadSave("user://username.save")
	if !!saveName:
		playerName = saveName
		$NameInput.text = saveName
		
func _on_player_connected():
	owner.get_node("Lobby").show()		
	if get_tree().is_network_server(): owner.get_node("Lobby/StartButton").show()
	refreshLobby()
	
func refreshLobby():
	var rich:RichTextLabel = owner.get_node('Lobby/RichTextLabel')
#	var networkPlayersSorted = 
	rich.bbcode_text = ""
	for k in Network.players.keys():
		var v = Network.players[k]
		rich.bbcode_text += (("[color=grey]" + v.name + "[/color]") if k != 1 else ("[color=red][HOST][/color] " + v.name)) + '\n'
#	rich.rect_size.y = rich.get_font("font").get_string_size(rich.bbcode_text).y
	

func _on_Play_pressed():
	if playerName == "":
		$NameInput.modulate = Color("ff0000")
		return
	SaveManager.save(playerName, "user://username.save")
	Network.create_server(playerName)
	$NameInput.editable = false
	$Play.disabled = true
	$Play2.disabled = true
	_on_player_connected()
	
#	var label = Label.new()
#	$'/root/TitleScreen/Lobby'.add_child_below_node(owner.get_node("Lobby/Title"), label)
#	label.text = playerName
#	get_tree().change_scene("res://MatWorld.tscn")
	
func _on_Hub_pressed():
	return
#	get_tree().change_scene("res://Spawn.tscn")


func _on_NameInput_text_changed(new_text):
	$NameInput.modulate = Color("ffffff")
	playerName = new_text


func _on_Play2_pressed():
	if playerName == "":
		$NameInput.modulate = Color("ff0000")
		return
	SaveManager.save(playerName, "user://username.save")
	$NameInput.editable = false
	$Play.disabled = true
	$Play2.disabled = true
	owner.get_node("Lobby").show()	
	Network.connect_to_server(playerName)
#	var label = Label.new()
#	$'/root/TitleScreen/Lobby'.add_child(label)
#	label.text = playerName
#	get_tree().change_scene("res://MatWorld.tscn")


func _on_StartButton_pressed():
	rpc("startGame")
	
remotesync func startGame():
	get_tree().change_scene("res://MatWorld.tscn")
	for i in Network.players.keys():
#		if i != 1:
			Network.rpc("addToWorld", i)
	#		print(Network.players[i])
			if Network.players[i].playerScene.is_network_master():
	#			Network.update_position(i, Vector2(222, 100))
				Network.addToWorld(i)
