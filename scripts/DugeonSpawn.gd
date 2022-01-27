extends Node2D

var roomsGrid = {}
var roomSize = Vector2(340, 215)
var spaceBetweenRooms = 10
var playerRoom = null

onready var roomTemplates = [
	preload("res://rooms/CapybaraMiniboss.tscn"),
	#preload("res://rooms/CapybaraMiniboss.tscn")
	#preload("res://rooms/hell.tscn")
]
onready var door = preload("res://scenes/Door.tscn")
onready var Player = get_tree().get_current_scene().get_node("Player")
onready var camera = get_tree().get_current_scene().get_node("Camera2D")

var posAndDirections = {
	"Up" : Vector2(0, -1),
	"Down" : Vector2(0, 1),
	"Right" : Vector2(1, 0),
	"Left" : Vector2(-1, 0)
}

var directions = [
	"Up",
	"Down",
	"Left",
	"Right"
]

const addX = 153
const addY = 90

var doorZones = {
	"Up" : Vector2(0, -60),
	"Down": Vector2(0, 60),
	"Right": Vector2(60, 0),
	"Left" : Vector2(-60, 0)
}

func invertDirection(direction):
	if direction == "Up":
		return "Down"
	elif direction == "Down":
		return "Up"
	elif direction == "Right":
		return "Left"
	elif direction == "Left":
		return "Right"

func checkRoomByGrid(grid):
	
	return roomsGrid.has(grid)

func getRoomByGrid(grid):
	
	print(grid)
	
	return roomsGrid[grid].room

func movePlayerAndCamera(grid, direction):
	
	var room = roomsGrid[grid].room
	
	var cameraPos = Vector2(room.position.x + addX, room.position.y + addY) 
	
	camera.position = cameraPos
	Player.position = Vector2(room.position.x + roomSize.x / 2 , room.position.y + roomSize.y / 2)
	
	
func goToRoom(direction):
	
	var grid = convertDirectionToGrid(direction)
	
	var roomPosition
	var room = null
	
	for gridLayout in roomsGrid:
		if roomsGrid[gridLayout].room == playerRoom:
			roomPosition = gridLayout
			
	var gridToMove = Vector2(roomPosition.x + grid.x, roomPosition.y + grid.y)
	
	if checkRoomByGrid(gridToMove) == false:
		create_room(gridToMove, direction)
		movePlayerAndCamera(gridToMove, direction)
	else:
		movePlayerAndCamera(gridToMove, direction)

	playerRoom = getRoomByGrid(gridToMove)
	
	print(playerRoom)

func convertDirectionToGrid(direction):
	
	if (direction == null):
		return Vector2(0, 0)
	else:
		return posAndDirections[str(direction)]

func create_room(gridLayout, backDoor = null):
		
	var room = roomTemplates[randi() % len(roomTemplates) - 1].instance()
	add_child(room)
	
	var yPos = gridLayout.y * (roomSize.y + spaceBetweenRooms)
	
	var xPos = gridLayout.x * (roomSize.x + spaceBetweenRooms)
	
	var roomPosition = Vector2(xPos, yPos)
	
	var doors = []
	
	room.position = roomPosition
	
	var maxIndex = 3
	var updatedDirections = directions.duplicate()
	
	if backDoor != null:
		maxIndex = 2
		updatedDirections.erase(invertDirection(backDoor))
		print(updatedDirections)
	
	var randIndex = randi() % maxIndex
	var pickedDirection
	
	for index in range(0, maxIndex):
		if randIndex == index:
			pickedDirection = updatedDirections[index]
	
	var spawnedDoor = door.instance()
	room.add_child(spawnedDoor)
	spawnedDoor.position = room.get_node(str(pickedDirection)).position	
	spawnedDoor.set_direction(pickedDirection)
	
	doors.append(pickedDirection)
	
	if (backDoor != null):
		
		var direction = backDoor
		
		backDoor = door.instance()
		room.add_child(backDoor)
		backDoor.position = room.get_node(str(invertDirection(direction))).position
		backDoor.set_direction(invertDirection(direction))
		
		doors.append(backDoor)
	
	roomsGrid[gridLayout] = {
		"room" : room,
		"doors" : doors
	}
	
	if (gridLayout == Vector2.ZERO):
		playerRoom = room
		
	return room

func _ready():
	randomize()	
	create_room(Vector2.ZERO, null)
