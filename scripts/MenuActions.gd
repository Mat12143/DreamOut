extends VBoxContainer

var playerName = ""

func _ready():
	var saveName = SaveManager.loadSave("user://username.save")
	if !!saveName:
		playerName = saveName
		$NameInput.text = saveName
	

func _on_Play_pressed():
	if playerName == "":
		$NameInput.modulate = Color("ff0000")
		return
	SaveManager.save(playerName, "user://username.save")
	Network.create_server(playerName)
	$NameInput.editable = false
	$Play.disabled = true
	$Play2.disabled = true
	owner.get_node("Lobby").show()
	owner.get_node("Lobby/StartButton").show()
	var label = Label.new()
	$'/root/TitleScreen/Lobby'.add_child_below_node(owner.get_node("Lobby/Title"), label)
	label.text = playerName
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
	Network.connect_to_server(playerName)
	$NameInput.editable = false
	$Play.disabled = true
	$Play2.disabled = true
	owner.get_node("Lobby").show()
	var label = Label.new()
	$'/root/TitleScreen/Lobby'.add_child(label)
	label.text = playerName
#	get_tree().change_scene("res://MatWorld.tscn")


func _on_StartButton_pressed():
	pass # Replace with function body.
