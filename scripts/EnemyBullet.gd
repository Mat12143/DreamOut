extends Area2D

export var speed = 1000

func _physics_process(delta):
		position += transform.x * speed * delta

func _on_Bullet_body_entered(body):
		if body.is_in_group("Player"):
				body.health -= 1
#				body.queue_free()
				pass
#		print(body.is_in_group("friendlyProjectilesPassThrough"))
		if !body.is_in_group('mobs'):
			queue_free()

