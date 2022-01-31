extends Tween

var okLetsGo = -2
var floater

func _ready():
	if owner.is_in_group("FloatOwnerOwner"): floater = owner.owner
	else: floater = owner
	interpolate_property(floater, "position:y", floater.position.y, floater.position.y + okLetsGo, 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	start()


func _on_Float_tween_completed(object, key):
	okLetsGo *= -1
	interpolate_property(floater, "position:y", floater.position.y, floater.position.y + okLetsGo, 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	start()
