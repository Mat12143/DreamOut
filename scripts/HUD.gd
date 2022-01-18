extends CanvasLayer

func _on_GlobalEventManager_playerHit(damage):
	print('ASDDS')
	var body = get_parent().get_node("Player")
	print('ASDAS')
	$PortraitAndHealth/Portrait/HPBar.value = (float(body.health) / body.maxHealth * 100)
