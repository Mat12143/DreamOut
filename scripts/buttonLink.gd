extends TextureButton

export (String) var link

func _ready():
	pass


func _on_Button_pressed():
	OS.shell_open("https://" + link)
