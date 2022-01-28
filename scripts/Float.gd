extends Tween

var okLetsGo = -2

func _ready():
	interpolate_property(owner, "position:y", owner.position.y, owner.position.y + okLetsGo, 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	start()


func _on_Float_tween_completed(object, key):
	okLetsGo *= -1
	interpolate_property(owner, "position:y", owner.position.y, owner.position.y + okLetsGo, 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	start()
