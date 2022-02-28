extends Node
class_name EnemyWeapon
var Bullet
var bulletModulate
var bulletSpeed
var bulletDamage

func shoot(player):
	for i in $Cannons.get_children():
		lookAtPlayer(i, player)
		makeBullet(i, player)
		
func lookAtPlayer(cannon, player):
	cannon.look_at(player.global_position)

func addTransformToBullet(cannon, b):
	b.transform = cannon.global_transform

func makeBullet(cannon, player):
	var b = Bullet.instance()
	b.inject(player)
	b.modulate = bulletModulate
	get_tree().current_scene.add_child(b)
	b.speed = bulletSpeed
	b.damage = bulletDamage
	addTransformToBullet(cannon, b)
