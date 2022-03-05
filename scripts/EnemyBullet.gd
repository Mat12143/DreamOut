extends EnemyBullet

var d := 0.0

func _process(delta):
	d += delta
	
	position = Vector2(sin(d), cos(d)) + Vector2(30, 30)
