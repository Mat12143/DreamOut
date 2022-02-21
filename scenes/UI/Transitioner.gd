extends CanvasLayer

var oneWay = false

func _ready():
#	transition()
	pass

func transition(newOneWay=false):
	oneWay = newOneWay
	$ColorRect.show()
	$AnimationPlayer.play("fade_in")
	


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_in" and !oneWay:
		yield(get_tree().create_timer(1), "timeout")
		$AnimationPlayer.play("fade_out")
