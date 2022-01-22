extends Sprite


func _ready():
	pass

func _process(_delta):
	look_at(get_global_mouse_position())
#	set_flip_v(transform.get_rotation() < -0.2)
