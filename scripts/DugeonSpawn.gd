extends Node2D

onready var roomTemplate = preload("res://rooms/StartRoom.tscn")
onready var door = preload("res://scenes/Door.tscn")
onready var Player = get_tree().get_current_scene().get_node("Player")
onready var camera = get_tree().get_current_scene().get_node("Camera2D")

const roomSizeX = 340
const roomSizeY = 215
const spaceBeetweenRooms = 10

var rooms = []
var playerMoves = []

func make_new_room(lastRoom, startDirection):
	
	var spawnDirection
	var newRoomPos
	
	if (startDirection == "Up"):
		spawnDirection = "Down"
		newRoomPos = Vector2(lastRoom.position.x, lastRoom.position.y - roomSizeY - spaceBeetweenRooms)
		
	if (startDirection == "Down"):
		spawnDirection = "Up"
		newRoomPos = Vector2(lastRoom.position.x , lastRoom.position.y + roomSizeY + spaceBeetweenRooms)
		
	if (startDirection == "Right"):
		spawnDirection = "Left"
		newRoomPos = Vector2(lastRoom.position.x + roomSizeX + spaceBeetweenRooms, lastRoom.position.y)
		
	if (startDirection == "Left"):
		spawnDirection = "Right"
		newRoomPos = Vector2(lastRoom.position.x - roomSizeX - spaceBeetweenRooms, lastRoom.position.y)
		
	return make_room(newRoomPos, spawnDirection)

var directions = ["Up", "Down", "Left", "Right"]
var newDirections
var room
const addX = 153
const addY = 90

var lastRoomDeleted 

func map(value, InputA, InputB, OutputA, OutputB):
	return(value - InputA) / (InputB - InputA) * (OutputB - OutputA) + OutputA

func next_room(roomToGo):
	
	var room = roomToGo
	
	var newPos = Vector2(room.position.x + addX, room.position.y + addY) 
	
	camera.position = newPos
	Player.position = newPos
	
	playerMoves.append(room)

func back_door(room):
	
	var doorRoom = playerMoves.find(room)
	var backRoom = playerMoves[doorRoom - 1]
	
	room = backRoom
	
	var newPos = Vector2(room.position.x + addX, room.position.y + addY) 
	
	camera.position = newPos
	Player.position = newPos
	
	playerMoves.append(room)
	
	

func make_room(position, spawnDoorPosition):
	
	room = roomTemplate.instance()
	add_child(room)
	room.position = position
	
	var maxIndex = 3
	
	if (spawnDoorPosition != "None"):
		maxIndex = 2
		newDirections = directions.duplicate()
		newDirections.erase(spawnDoorPosition)
		
		var lastRoom = door.instance()
		room.add_child(lastRoom)
		lastRoom.position = room.get_node(spawnDoorPosition).position
		lastRoom.set_back_door()
		lastRoom.set_current_room(room, spawnDoorPosition)
		
	else:
		newDirections = directions

	print(newDirections)
	
	var randI = randi() % maxIndex
	var pickedDirection
	
	for i in range(0, maxIndex):
		if (i == randI):
			pickedDirection = newDirections[i]
			break
			
	print(pickedDirection)
	var posToSpawn = room.get_node(pickedDirection)
	var spawnedDoor = door.instance()
	room.add_child(spawnedDoor)
	spawnedDoor.set_current_room(room, pickedDirection)
	spawnedDoor.position = posToSpawn.position
	
	var newPos = Vector2(room.position.x + addX, room.position.y + addY) 
	
	camera.position = newPos
	Player.position = newPos
	
	rooms.append(room)
	playerMoves.append(room)
	return room
	
func _ready():
	randomize()
	make_room(get_parent().position, "None")
