extends Area2D
var direction

func set_direction(newDirection):

	direction = newDirection

func _on_Door_body_entered(body):
	
	if body.get_name() != "Player": return false
	
	get_tree().get_current_scene().get_node("DungeonSpawn").goToRoom(direction)
