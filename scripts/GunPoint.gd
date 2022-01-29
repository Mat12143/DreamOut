extends Node2D


func _ready():
	pass

func _process(_delta):
	if !get_tree().current_scene.get_node("HUD/ChatBox/VBoxContainer/LineEdit").is_visible():
		look_at(get_global_mouse_position())
#	set_flip_v(transform.get_rotation() < -0.2)
