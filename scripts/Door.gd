extends Area2D
var direction

func set_direction(newDirection):

	direction = newDirection

func _on_Door_body_entered(body:Node):
	
	if !body.is_in_group("Player"): return false
	

	
	var collidingUnfiltered = get_overlapping_bodies()
	var colliding = []
	for i in collidingUnfiltered:
		if i.is_in_group("Player"):
			colliding.append(i)
			
	if len(colliding) == len(Network.players):
			get_tree().get_current_scene().get_node("DungeonSpawn").goToRoom(direction)
