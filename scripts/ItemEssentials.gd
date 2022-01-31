extends Area2D

var toTweenOrNotToTween = true

func _on_Tween_tween_completed(object, key):
	queue_free()
#	pass


func _on_ItemEssentials_body_entered(body:Node):
	if (body.is_in_group("Player")):
		get_tree().get_current_scene().get_node("GlobalEventManager").emit_signal("popupText", owner._name, owner.popup)
		if owner.type == 0:
			body.data.inventory.append(owner.id)		
		owner.get_node("Logic").pickup(body)
#		get_tree().get_current_scene().get_node("GlobalEventManager").emit_signal("upgradePickedUp", key, value)
		$AudioStreamPlayer2D.play()
		$Tween.interpolate_property(
			owner, "modulate", Color('ffffff'), Color('00ffffff'), 0.3
		)
		if (toTweenOrNotToTween):
			$Tween.start()
		toTweenOrNotToTween = false
#		queue_free()
