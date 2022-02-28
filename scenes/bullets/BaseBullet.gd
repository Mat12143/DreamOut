extends Area2D
class_name EnemyBullet

var speed = 100
var damage:float = 1
var distanceTravelled = 0
var player
var destroyingIncoming = false

func inject(newPlayer):
	player = newPlayer

func _physics_process(delta):
	travel(delta)

func travel(delta):
	distanceTravelled += 1
	position += transform.x * speed * delta
	
func destroyAfterABit():
	yield(get_tree().create_timer(1), "timeout")
	queue_free()

func playSound():
		get_tree().current_scene.get_node("BulletSounds").play()
		
func destroy(body):
	if body.is_in_group("Player"):
		get_tree().get_current_scene().get_node("GlobalEventManager").emit_signal("playerHit", damage, body.name, "a bullet")
	if body.is_in_group('Soft'):
		body.health -= 1
	if !body.is_in_group('mobs'):
		queue_free()

func _on_Bullet_body_entered(body):
		playSound()
		destroy(body)
