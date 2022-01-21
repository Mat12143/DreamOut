extends Area2D

export var speed = 100
export var damage = 1

func _physics_process(delta):
		position += transform.x * speed * delta

func _on_Bullet_body_entered(body):
		if body.is_in_group("Player"):
			get_tree().get_current_scene().get_node("GlobalEventManager").emit_signal("playerHit", damage)
#				body.health -= 1mmmkmlmlm
##				print(get_parent())
#				get_parent().get_node('HUD/PortraitAndHealth/BarEmpty/HPBar').value = (float(body.health) / body.maxHealth * 100)
#				body.queue_free()
#		print(body.is_in_group("friendlyProjectilesPassThrough"))
		if !body.is_in_group('mobs'):
			queue_free()

