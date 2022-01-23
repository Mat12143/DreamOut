extends Control

onready var chatLog = get_node("VBoxContainer/ChatLog")
onready var inputField = get_node("VBoxContainer/LineEdit")


func _ready():
	inputField.hide()
	$VBoxContainer/ChatLog.get_child(0).rect_scale.x = 0

func _input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_ENTER:
			inputField.grab_focus()
			inputField.show()
			chatLog.show()
			$VBoxContainer/ChatSweeper.start(10)
		elif event.pressed and event.scancode == KEY_ESCAPE:
			inputField.release_focus()
			inputField.hide()


func _on_LineEdit_text_entered(new_text):
	if (new_text != ''):
		print(new_text)
		inputField.text = ''
		get_tree().current_scene.get_node("GlobalEventManager").emit_signal("messageEntered", get_tree().current_scene.get_node("Player").data.name, new_text)
		inputField.release_focus()
		inputField.hide()

func _process(delta):
	if $VBoxContainer/ChatSweeper.is_stopped() and !inputField.visible:
		chatLog.hide()
#		print("GIUR")
		

func _on_GlobalEventManager_messageEntered():
	$VBoxContainer/ChatSweeper.start(10)
