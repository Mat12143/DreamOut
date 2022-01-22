extends Area2D

export var speed = 1000
var damage = 1
var bulletType = false

func _physics_process(delta):
		position += transform.x * speed * delta
		
func initialize(newDamage, newSpeed, newType):
	damage = newDamage
	speed = newSpeed
	bulletType = newType

func _on_Bullet_body_entered(body):
		
		if body.is_in_group("mobs"):
			if body.get_node("IFrameTimer").is_stopped():
				if bulletType != 2: # 2 = shotgun
					body.get_node("IFrameTimer").start(0.1)
				body.health -= damage
				body.get_node("HPBar").show()
				body.get_node("HPBar").value = (float(body.health) / body.maxHealth * 100)
				body.get_node("AI/Exclamation").show()
				if (body.get_node("AI/Exclamation").frame == 0):
					body.get_node("AI/Exclamation/AnimationPlayer").play("Disappear")
				body.get_node("HurtSound").play()
				body.get_node("AI").forceEngage = true
				body.get_node("AI").set_state(1)
				body.get_node("AI").player = get_parent().get_node("Player")
#		print(body.is_in_group("friendlyProjectilesPassThrough"))
		if !body.is_in_group('friendlyProjectilesPassThrough'):
#			$WallSound.play(0.0)
			if bulletType == 4: # RPG
				print("fai finta che sono esploso")			
			queue_free()
