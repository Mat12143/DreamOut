extends Node2D

signal playerHit(damage, _name, reason)
signal playerHeal(value)
signal dead(player)
signal upgradePickedUp
signal messageEntered(author, text, optionalData)
signal popupText(title, subtitle)
signal shake(duration, frequency, amplitude, priority)
signal roomEnter(roomData)

onready var startPopupPos = get_tree().current_scene.get_node('HUD/PopupText').rect_position
var msgDataTemplate = {"whisperRecipient": "nowhisper", "hideAuthor": false}

var player 

func inject(newPlayer):
	player = newPlayer
	
func _on_GlobalEventManager_messageEntered(author:String, text:String, optionalData:Dictionary = msgDataTemplate):
	for i in msgDataTemplate:
		if !optionalData.has(i):
			optionalData[i] = msgDataTemplate[i]
		
	if optionalData.hideAuthor: author = ''
	else: author = "[" + author + "] "
	
	if optionalData.whisperRecipient != "nowhisper": rpc_id(int(optionalData.whisperRecipient), "sendMsg", author, text)
	else: rpc("sendMsg", author, text)
	
remotesync func sendMsg(author:String, text:String):
	var chatBox = get_tree().current_scene.get_node("HUD/ChatBox/VBoxContainer/ChatLog")
	text = text.strip_edges()
	if (text.begins_with('/')):
		pass
	else:
		var newText = "\n[color=grey]%s[/color]%s" % [author, text]
		chatBox.bbcode_text += newText.replace("@%s" % player.data.name, "[color=blue]@%s[/color]" % player.data.name) # TAGGG
	get_tree().current_scene.get_node("HUD/ChatBox/VBoxContainer/ChatSweeper").start(10)
	chatBox.show()


func _on_GlobalEventManager_popupText(title, subtitle):
	var popup = get_tree().current_scene.get_node('HUD/PopupText')
	popup.show()
	popup.get_node("Title").bbcode_text = "[center]" + title + "[/center]"
	popup.get_node("Subtitle").bbcode_text =  "[center]" + subtitle + "[/center]"
	$PopupTimer.start(2)
	
	
func _on_Tween_tween_completed(object, key):
	var popup = get_tree().current_scene.get_node('HUD/PopupText')
	popup.hide()
	popup.rect_position.y -= 70
	

func _on_GlobalEventManager_shake(duration, frequency, amplitude, priority):
	pass # Replace with function body.


func _on_PopupTimer_timeout():
	var popup = get_tree().current_scene.get_node('HUD/PopupText')
	var tween = get_tree().current_scene.get_node('HUD/PopupText/Tween')
	tween.interpolate_property(popup, "rect_position",
				Vector2(0, 0), Vector2(0, 70), 0.2,
				Tween.TRANS_SINE, Tween.EASE_OUT)
	tween.start()
