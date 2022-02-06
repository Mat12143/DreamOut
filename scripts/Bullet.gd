extends Area2D

export var speed = 1000
var damage = 1
var bulletType = false
var gunRange = 20
var distanceTravelled = 0
var dontMove = false
var explosionRadius = 50
export (PackedScene) var explosion
onready var hitParticle = preload("res://scenes/particles/enemyHit.tscn")

enum {
	DISTANCE,
	HITWALL,
	HITENEMY
}

func _physics_process(delta):
		distanceTravelled += 1
		if (!dontMove): position += transform.x * speed * delta
#		print(gunRange)
		if (distanceTravelled == gunRange):
			destroy(DISTANCE, {"invincible": false})
func destroy(reason, body):
	if !body.get("invincible") or body.invincible == false:
		
		if bulletType == 3 and !dontMove: # RPG
	#		$Explosion.show()
			var boom = explosion.instance()
			get_tree().current_scene.add_child(boom)
	#		print($Explosion.get_instance_id())
			$CollisionShape2D.shape.radius = explosionRadius
			boom.position = global_position
			damage -= 3
		dontMove = true
		get_tree().current_scene.get_node("BulletSounds").play()
	#	print(reason)
	#	if reason == DISTANCE:
	#		var t = Tween.new()
	#		add_child(t)
	#		t.interpolate_property(self, "modulate", Color('ffffff'), Color('00ffffff'), 0.05)
	#		t.start()
		if bulletType == 3:
			yield(get_tree().create_timer(0.03), "timeout")
		queue_free()
	else:
		rotation = -rotation
		
func initialize(newDamage, newSpeed, newType, newRange):
	$CollisionShape2D.shape.radius = 3
	damage = newDamage
	speed = newSpeed
	bulletType = newType
	if bulletType == 2:
		randomize()
		speed = rand_range(newSpeed - 50, newSpeed + 50)
	gunRange = newRange
#	print([damage, speed, bulletType, gunRange])

func _on_Bullet_body_entered(body):
		var reason
		if body.is_in_group("mobs"):
			reason = HITENEMY
			if !body.get("invincible") or body.invincible == false:
				if body.get_node("IFrameTimer").is_stopped() or body.hitFromShotGun:
					# 2 = shotgun
					body.hitFromShotGun = bulletType == 2
					body.get_node("IFrameTimer").start(0.3)
					body.health -= damage
					body.get_node("HPBar").show()
					body.get_node("HPBar").value = (float(body.health) / body.maxHealth * 100)
					body.get_node("AI/Exclamation").show()
					if (body.get_node("AI/Exclamation").frame == 0):
						body.get_node("AI/Exclamation/AnimationPlayer").play("Disappear")
					body.get_node("HurtSound").play()
					body.get_node("AI").forceEngage = true
					if body.get_node("AI").state == 0:
						body.get_node("AI").set_state(1)
						body.get_node("AI/FireDelayTimer").start(1)
					body.get_node("AI").player = get_parent().get_node("Player")
				var p = hitParticle.instance()
				get_tree().current_scene.add_child(p)
				p.rotation = rotation
				p.position = body.global_position
			elif body.get_node("HitInvincible"):
				body.get_node("HitInvincible").play()
				
			
					
#		print(body.is_in_group("friendlyProjectilesPassThrough"))
		if body.is_in_group('Soft'):
			body.health -= 1
		if !body.is_in_group('friendlyProjectilesPassThrough') and $CollisionShape2D.shape.radius != explosionRadius:
			reason = HITWALL
			destroy(reason, body)
		
#		print(distanceTravelled)
