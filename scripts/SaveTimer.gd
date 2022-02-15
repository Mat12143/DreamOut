extends Timer


func _ready():
	start(5)

func _process(delta):
	if is_stopped():
		start(5)
		SaveManager.save(owner.data, "user://plr.save")
