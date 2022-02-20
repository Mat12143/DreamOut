extends Area2D

export var speed = 100
export var damage:float = 1
var distanceTravelled = 0
var player

func inject(newPlayer):
	player = newPlayer

func _physics_process(delta):
	distanceTravelled += 1
	position += transform.x * speed * delta
	if get_name().begins_with("@HomingMissile"):
		if distanceTravelled < 40:
			look_at(player.global_position)
		

func _on_Bullet_body_entered(body):
		get_tree().current_scene.get_node("BulletSounds").play()
		if body.is_in_group("Player"):
			get_tree().get_current_scene().get_node("GlobalEventManager").emit_signal("playerHit", damage, body.name, "a bullet")
#				body.health -= 1mmmkmlmlm
##				print(get_parent())
#				get_parent().get_node('HUD/PortraitAndHealth/BarEmpty/HPBar').value = (float(body.health) / body.maxHealth * 100)
#				body.queue_free()
#		print(body.is_in_group("friendlyProjectilesPassThrough"))
		if body.is_in_group('Soft'):
			body.health -= 1
		if !body.is_in_group('mobs'):
			queue_free()

