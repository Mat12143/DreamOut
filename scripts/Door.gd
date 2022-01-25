extends Area2D

var room
var direction
var backDoor = false
var passedDoor = false
var nextRoom

func set_current_room(actualRoom, pickedDirection):
	
	room = actualRoom
	direction = pickedDirection

func set_back_door():
	backDoor = true

func _on_Door_body_entered(body):
	
	if (body.get_name() != "Player"): return false
	
	var dungeonSpawn = get_tree().get_current_scene().get_node("DungeonSpawn")
	
	if (passedDoor):
		dungeonSpawn.next_room(nextRoom, direction)
		
	
	elif (backDoor):
		dungeonSpawn.back_room(room, direction)
	
	else:
	
		nextRoom = dungeonSpawn.make_new_room(room, direction)
		passedDoor = true

