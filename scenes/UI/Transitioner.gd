extends CanvasLayer

var oneWay = false
var sceneToChange = ""

func _ready():
#	transition()
	pass

func transition(newOneWay=false, newScene=""):
	oneWay = newOneWay
	sceneToChange = newScene
	$ColorRect.show()
	$AnimationPlayer.play("fade_in")
	


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_in" and !oneWay:
		yield(get_tree().create_timer(1), "timeout")
		# CAMBIA SCENA
		$AnimationPlayer.play("fade_out")
