extends Node2D

onready var roomTemplate = preload("res://rooms/StartRoom.tscn")

func _ready():
	randomize()
	make_start_room()
	
func make_start_room():
	
	
	var firstRoom = roomTemplate.instance()
	add_child(firstRoom)
	firstRoom.position = get_parent().position
	
	var randI = randi() % 4
	var index = 0
	var pickedRoom
	
	for room in firstRoom.get_children():
		if (room.name != "Map"):
			if (randI == index):
				pickedRoom = room
				break
			else:
				index += 1
	
	pickedRoom.visible = true
	
