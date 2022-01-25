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

var directions = ["Up", "Down", "Left", "Right"]
var newDirections
const addX = 153
const addY = 90

func getNewDoorPlayer(centerPosition, roomPosition, doorDirection):
	
	doorDirection = invertDirection(doorDirection)
	
	var addRangeY = 0
	var addRangeX = 0
	var distance = 60
	
	if (doorDirection == "Up"):
		addRangeY += distance
		
	elif (doorDirection == "Down"):
		addRangeY -= distance
		
	elif (doorDirection == "Right"):
		addRangeX -= distance
		
	elif (doorDirection == "Left"):
		addRangeX += distance
		
	print(str(addRangeX) + "/" + str(addRangeY))
	
	
	return Vector2(roomPosition.x + centerPosition.x + addRangeX, roomPosition.y + addRangeY + centerPosition.y)
	
func invertDirection(direction):
	if direction == "Up":
		return "Down"
	elif direction == "Down":
		return "Up"
	elif direction == "Right":
		return "Left"
	elif direction == "Left":
		return "Right"

func invertRoomPos(room, startDirection):
	
	var newRoomPos
	var spawnDirection
	
	if (startDirection == "Up"):
		spawnDirection = "Down"
		newRoomPos = Vector2(room.position.x, room.position.y - roomSizeY - spaceBeetweenRooms)
		
	if (startDirection == "Down"):
		spawnDirection = "Up"
		newRoomPos = Vector2(room.position.x , room.position.y + roomSizeY + spaceBeetweenRooms)
		
	if (startDirection == "Right"):
		spawnDirection = "Left"
		newRoomPos = Vector2(room.position.x + roomSizeX + spaceBeetweenRooms, room.position.y)
		
	if (startDirection == "Left"):
		spawnDirection = "Right"
		newRoomPos = Vector2(room.position.x - roomSizeX - spaceBeetweenRooms, room.position.y)
		
	return [spawnDirection, newRoomPos]

func make_new_room(lastRoom, startDirection):
	
	var returns = invertRoomPos(lastRoom, startDirection)
	var spawnDirection = returns[0]
	var newRoomPos = returns[1]
		
	return make_room(newRoomPos, spawnDirection)

func spawnPlayerCamera(playerPos, cameraPos):
	
	camera.position = cameraPos
	Player.position = playerPos
	
	print(playerPos)
	
	
func next_room(roomToGo, direction):
	
	var cameraPos = Vector2(roomToGo.position.x + addX, roomToGo.position.y + addY)
	
	var centerPos = roomToGo.get_node("Center").position
	
	var playerPos = getNewDoorPlayer(centerPos, roomToGo.position, invertDirection(direction))

	spawnPlayerCamera(playerPos, cameraPos)
	
	playerMoves.append(roomToGo)

func back_room(room, direction):
	
	var doorRoomPosition = playerMoves.find(room)
	var backRoom = playerMoves[doorRoomPosition - 1]
	
	var cameraPos = Vector2(backRoom.position.x + addX, backRoom.position.y + addY) 
	var playerPos = getNewDoorPlayer(backRoom.get_node("Center").position, backRoom.position, invertDirection(direction))
	
	spawnPlayerCamera(playerPos, cameraPos)
	
	playerMoves.append(backRoom)
	

func make_room(position, spawnDoorPosition):
	
	var room = roomTemplate.instance()
	add_child(room)
	room.position = position
	
	var maxIndex = 3
	
	if (spawnDoorPosition != "None"):
		maxIndex = 2
		newDirections = directions.duplicate()
		newDirections.erase(spawnDoorPosition)
		
		var lastDoor = door.instance()
		room.add_child(lastDoor)
		lastDoor.position = room.get_node(spawnDoorPosition).position
		lastDoor.set_back_door()
		lastDoor.set_current_room(room, spawnDoorPosition)
		
	else:
		newDirections = directions
	
	var randI = randi() % maxIndex
	var pickedDirection
	
	for i in range(0, maxIndex):
		if (i == randI):
			pickedDirection = newDirections[i]
			break
			
	var posToSpawn = room.get_node(pickedDirection)
	var spawnedDoor = door.instance()
	room.add_child(spawnedDoor)
	spawnedDoor.set_current_room(room, pickedDirection)
	spawnedDoor.position = posToSpawn.position
	
	var cameraPos = Vector2(room.position.x + addX, room.position.y + addY)
	var playerPos = cameraPos
	
	if (spawnDoorPosition != "None"):
		
		var centerPos = room.get_node("Center").position
	
		playerPos = getNewDoorPlayer(centerPos, room.position, spawnDoorPosition)
	
	spawnPlayerCamera(playerPos, cameraPos)
	
	rooms.append(room)
	playerMoves.append(room)
	return room
	
func _ready():
	rand_seed(2)
	randomize()
	make_room(get_parent().position, "None")
