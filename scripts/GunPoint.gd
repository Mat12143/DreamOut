extends Node2D


func _ready():
	pass


puppet var puppet_rotation = 0

func _process(_delta):
	if is_network_master():
		if !get_tree().current_scene.get_node("HUD/ChatBox/VBoxContainer/LineEdit").is_visible():
			look_at(get_global_mouse_position())
			rset_unreliable('puppet_rotation', rotation)
	else:
		rotation = puppet_rotation
#	set_flip_v(transform.get_rotation() < -0.2)
