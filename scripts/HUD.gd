extends CanvasLayer

func _on_GlobalEventManager_playerHit(_damage):
	var body = get_parent().get_node("Player")
	$PortraitAndHealth/Portrait/HPBar.value = (float(body.health) / body.maxHealth * 100)
