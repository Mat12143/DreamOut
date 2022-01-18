extends Area2D

export var speed = 1000
var damage = 1

func _physics_process(delta):
		position += transform.x * speed * delta

func _on_Bullet_body_entered(body):
		if body.is_in_group("mobs"):
				body.health -= damage
				body.get_node("HPBar").show()
				body.get_node("HPBar").value = (float(body.health) / body.maxHealth * 100)
				body.get_node("AI").forceEngage = true
				body.get_node("AI").set_state(1)
				body.get_node("AI").player = get_parent().get_node("Player")
#		print(body.is_in_group("friendlyProjectilesPassThrough"))
		if !body.is_in_group('friendlyProjectilesPassThrough'):
			queue_free()
