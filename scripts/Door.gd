extends Area2D
var direction

func set_direction(newDirection):

	direction = newDirection

func _on_Door_body_entered(body:Node):
	
	if !body.is_in_group("Player"): return false
	
	get_tree().get_current_scene().get_node("DungeonSpawn").goToRoom(direction)
