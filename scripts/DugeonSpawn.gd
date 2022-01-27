extends Node2D

var roomsGrid = {}
var roomSize = Vector2(340, 215)
var spaceBetweenRooms = 10
var playerRoom = null
var maxNumberRoom = 100
var createdRooms = 0
var nearDoorProb = 45
var moreDoorsProb = 50

onready var roomTemplates = [
	preload("res://rooms/CapybaraMiniboss.tscn"),
	preload("res://rooms/StartRoom.tscn"),
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
	
	return roomsGrid[grid].room

func movePlayerAndCamera(grid, direction):
	
	var room = roomsGrid[grid].room
	
	var cameraPos = Vector2(room.position.x + addX, room.position.y + addY) 
	
	camera.position = cameraPos
	Player.position = Vector2(room.position.x + roomSize.x / 2 , room.position.y + roomSize.y / 2)
	
	
func goToRoom(direction):
	print(direction)
	
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
	
	var spawnNearRoomDoor = randi() % 100 + 1	
	if (backDoor != null and spawnNearRoomDoor <= nearDoorProb):
		var newDirections = directions.duplicate()
		newDirections.erase(invertDirection(backDoor))
		
		for direction in newDirections:
			
			var grid = convertDirectionToGrid(direction)
			var nearRoomGrid = Vector2(gridLayout.x + grid.x, gridLayout.y + grid.y)
			
			if (checkRoomByGrid(nearRoomGrid)):
				
				updatedDirections.erase(direction)
				
				var nearRoom = getRoomByGrid(nearRoomGrid)
				var otherDoorPos = nearRoom.get_node(invertDirection(direction)).position

				var otherDoor = door.instance()
				nearRoom.add_child(otherDoor)
				otherDoor.position = otherDoorPos
				otherDoor.set_direction(invertDirection(direction))
				
				var roomDoorPos = room.get_node(direction).position
				var doorRoom = door.instance()
				room.add_child(doorRoom)
				doorRoom.position = roomDoorPos
				doorRoom.set_direction(direction)
				
				doors.append(direction)
				roomsGrid[nearRoomGrid].doors.append(invertDirection(direction))
				
				break
				
	if backDoor != null:
		maxIndex = maxIndex - 1
		updatedDirections.erase(invertDirection(backDoor))
	
	var randIndex = randi() % maxIndex
	var pickedDirection
	
	updatedDirections.shuffle()
	
	for index in range(0, maxIndex):
		if randIndex == index:
			pickedDirection = updatedDirections[index]
			
	if (createdRooms != maxNumberRoom - 1):
	
		var spawnedDoor = door.instance()
		room.add_child(spawnedDoor)
		spawnedDoor.position = room.get_node(str(pickedDirection)).position	
		spawnedDoor.set_direction(pickedDirection)
		
		updatedDirections.erase(pickedDirection)
		updatedDirections.shuffle()
		
		doors.append(pickedDirection)
		
		var gridDir = convertDirectionToGrid(pickedDirection)
		var roomToGoGrid = Vector2(gridLayout.x + gridDir.x, gridLayout.y + gridDir.y)
		
		if (checkRoomByGrid(roomToGoGrid)):
			
			var nearRoom = getRoomByGrid(roomToGoGrid)
			var nearDoor = door.instance()
			nearRoom.add_child(nearDoor)
			nearDoor.position = nearRoom.get_node(invertDirection(pickedDirection)).position
			nearDoor.set_direction(invertDirection(pickedDirection))
			roomsGrid[roomToGoGrid].doors.append(invertDirection(pickedDirection))
			

			
		var prob = randi() % 100
		
		if (prob <= moreDoorsProb and backDoor != null):
			
			var doorNum = randi() % 2
			
			for i in range(0, doorNum):
								
				pickedDirection = updatedDirections[randi() % len(updatedDirections) - 1]
				
				var gridToMove = convertDirectionToGrid(pickedDirection)
				var gridToGo = Vector2(gridLayout.x + gridToMove.x, gridLayout.y + gridToMove.y)
				
				if (checkRoomByGrid(gridToGo)):
					
					var nearRoom = getRoomByGrid(gridToGo)
					var nearDoor = door.instance()
					nearDoor.add_child(nearDoor)
					roomsGrid[gridToGo].doors.append(invertDirection(pickedDirection))
					nearDoor.position = nearRoom.get_node(pickedDirection).position
					nearDoor.set_direction(invertDirection(pickedDirection))
					
				var newDoor = door.instance()
				room.add_child(newDoor)
				newDoor.position = room.get_node(pickedDirection).position
				newDoor.set_direction(pickedDirection)
				
				doors.append(pickedDirection)
				
				updatedDirections.erase(pickedDirection)
				updatedDirections.shuffle()
	
	if (backDoor != null):
		
		var direction = backDoor
		
		backDoor = door.instance()
		room.add_child(backDoor)
		backDoor.position = room.get_node(str(invertDirection(direction))).position
		backDoor.set_direction(invertDirection(direction))
		
		doors.append(direction)
	
	roomsGrid[gridLayout] = {
		"room" : room,
		"doors" : doors
	}
	
	if (gridLayout == Vector2.ZERO):
		playerRoom = room
		
	createdRooms += 1
		
	return room

func _ready():
	randomize()	
	create_room(Vector2.ZERO, null)
