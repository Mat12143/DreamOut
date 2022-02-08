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
			var item = get_tree().current_scene.get_node("ItemDB").items[owner.id]
			body.loadInv[owner.id] = item		
		elif owner.type == 1:
			if typeof(body.consumable) != 0:
				print_debug("Fai finta che abbia droppato l'oggetto")
				# TODO drop oggetti
#				var oldCons = body.consumable.duplicate(0)
#				oldCons.global_position = body.global_position
#				oldCons.global_position.y += 20
#				get_tree().current_scene.add_child(oldCons)
#				oldCons.global_position.y += 2
			body.data.consumable = owner.id
			body.consumable = owner
#			print([body.consumable, body.data.consumable])
		owner.get_node("Logic").pickup(body)
		get_tree().get_current_scene().get_node("HUD").updateHud() # TODO far si che aggiorni l'interfaccia degli oggettti
			
#		get_tree().get_current_scene().get_node("GlobalEventManager").emit_signal("upgradePickedUp", key, value)
		$AudioStreamPlayer2D.play()
		$Tween.interpolate_property(
			owner, "modulate", Color('ffffff'), Color('00ffffff'), 0.3
		)
		if (toTweenOrNotToTween):
			$Tween.start()
		toTweenOrNotToTween = false
#		queue_free()
