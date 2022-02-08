extends Node2D

var roomsGrid = {}
var roomSize = Vector2(320, 180)
var spaceBetweenRooms = 30
var playerRoom = null
var maxNumberRoom = 1000
var createdRooms = 0
var nearDoorProb = 45
var moreDoorsProb = 70

onready var firstRoom =	preload("res://rooms/tutorialRoom.tscn")
onready var roomTemplates = [
	preload("res://rooms/CapyBara.tscn"),
	preload("res://rooms/StartRoom.tscn"),
	preload("res://rooms/idkRooms/theRock.tscn")
]
onready var door = preload("res://scenes/Door.tscn")
onready var Player = get_tree().get_current_scene().get_node("Player")
onready var camera = get_tree().get_current_scene().get_node("Camera2D")

onready var saveManager = get_tree().get_current_scene().get_node("SaveManager")
var posAndDirections = {
	"Up" : Vector2(0, -1),
	"Down" : Vector2(0, 1),
	"Right" : Vector2(1, 0),
	"Left" : Vector2(-1, 0)
}

var spawnDirections = {
	"Right": Vector2(-20, 0),
	"Left": Vector2(20, 0),
	"Down": Vector2(0, -15),
	"Up": Vector2(0, 15)
}

var directions = [
	"Up",
	"Down",
	"Left",
	"Right"
]

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
	
func createDoor(room, direction):
	
	var roomDoorPos = room.get_node(direction).position
	var doorRoom = door.instance()
	room.add_child(doorRoom)
	doorRoom.position = roomDoorPos
	doorRoom.set_direction(direction)
	

func movePlayerAndCamera(grid, direction):
	
	
	var room = getRoomByGrid(grid)
	var cameraPos = Vector2(room.position.x + roomSize.x / 2, room.position.y + roomSize.y / 2) 
	
	var t = Tween.new()
	add_child(t)
	t.interpolate_property(
		camera,
		"position", camera.position, cameraPos, 0.2
	)
	t.start()
#	room.hide()
	
	var Door = room.get_node(invertDirection(direction))
	if (direction != "Center"):
	
#	camera.position = cameraPos
		Player.position = Vector2(room.position.x + Door.position.x + spawnDirections[invertDirection(direction)].x, room.position.y + Door.position.y + spawnDirections[invertDirection(direction)].y)
#	yield(get_tree().create_timer(1), "timeout")
#	room.show()
	else:
		Player.position = Vector2(room.position.x + roomSize.x / 2, room.position.y + roomSize.y / 2)
	
	
func goToRoom(direction):
	print(direction)
	
	var grid = convertDirectionToGrid(direction)
	
	var roomPosition
	var room
	
	for gridLayout in roomsGrid:
		if roomsGrid[gridLayout].room == playerRoom:
			roomPosition = gridLayout
		
	var gridToMove = Vector2(roomPosition.x + grid.x, roomPosition.y + grid.y)
	
	if checkRoomByGrid(gridToMove) == false:
		create_room(gridToMove, direction)
		movePlayerAndCamera(gridToMove, direction)
	else:
		movePlayerAndCamera(gridToMove, direction)
	
	get_tree().current_scene.get_node("GlobalEventManager").emit_signal("roomEnter", getRoomByGrid(gridToMove))

	playerRoom = getRoomByGrid(gridToMove)

func convertDirectionToGrid(direction):
	
	if (direction == null):
		return Vector2(0, 0)
	else:
		return posAndDirections[str(direction)]

func create_room(gridLayout, backDoor = null):
	var room
	if createdRooms == 0: room = firstRoom.instance()
	else: room = roomTemplates[randi() % len(roomTemplates) - 1].instance()
	add_child(room)
	
	var yPos = gridLayout.y * (roomSize.y + spaceBetweenRooms)
	
	var xPos = gridLayout.x * (roomSize.x + spaceBetweenRooms)
	
	var roomPosition = Vector2(xPos, yPos)
	
	var doors = []
	
	room.position = roomPosition
	
	var updatedDirections = directions.duplicate()
	
	var spawnNearRoomDoor = randi() % 100 + 1
	
	if (backDoor != null):
		
		# Spawno la door per tornare indietro
		createDoor(room, invertDirection(backDoor))
		doors.append(backDoor)
		updatedDirections.erase(backDoor)
	
	updatedDirections.shuffle()
			
	# Controllo il numero massimo di stanze
	if (createdRooms != maxNumberRoom - 1):
		
		# Controllo tutte le direzioni rimanenti per evitare di spawnare
		# porte nelle direzioni dove ci sono già stanze spawnate
		
		var noRoomDirections = []
		var roomDirections = []
		
		for direction in updatedDirections:
			
			var gridDirection = convertDirectionToGrid(direction)
			var gridToMove = Vector2(gridLayout.x + gridDirection.x, gridLayout.y + gridDirection.y)
			
			if (checkRoomByGrid(gridToMove) == false):
				noRoomDirections.append(direction)
			else:
				roomDirections.append(direction)
				
#		if (randi() % 100 <= nearDoorProb and len(roomDirections) != 0):
#
#			var randomDirection = roomDirections[randi() % len(roomDirections) - 1]
#
#			var grid = convertDirectionToGrid(randomDirection)
#			var nearRoomGrid = Vector2(gridLayout.x + grid.x , gridLayout.y + grid.y)
#
#			var nearRoom = getRoomByGrid(nearRoomGrid)
#
#			createDoor(room, randomDirection)
#			doors.append(randomDirection)
#
#			createDoor(nearRoom, invertDirection(randomDirection))
#			roomsGrid[nearRoomGrid].doors.append(invertDirection(randomDirection))
#
#			roomDirections.erase(randomDirection)
#			if (noRoomDirections.has(randomDirection)) : noRoomDirections.erase(randomDirection)
			
		if (len(noRoomDirections) != 0):
			
			noRoomDirections.shuffle()
			var randomDirection = noRoomDirections[randi() % len(noRoomDirections) - 1]
			
			createDoor(room, randomDirection)
			doors.append(randomDirection)
			
			noRoomDirections.erase(randomDirection)
			noRoomDirections.shuffle()
			
			if (len(noRoomDirections) != 0 and randi() % 100 <= moreDoorsProb):
				
				var newDirection = noRoomDirections[randi() % len(noRoomDirections) - 1]
				createDoor(room, newDirection)
				doors.append(newDirection)
		
		else:
			
			updatedDirections.shuffle()
			
			var randomDirection = roomDirections[randi() % len(updatedDirections) - 1]
			
			createDoor(room, randomDirection)
			doors.append(randomDirection)
			
			var grid = convertDirectionToGrid(randomDirection)
			var gridToRoom = Vector2(gridLayout.x + grid.x, gridLayout.y + grid.y)
			
			var nearRoom = getRoomByGrid(gridToRoom)
			createDoor(nearRoom, invertDirection(randomDirection))
			roomsGrid[gridToRoom].doors.append(invertDirection(randomDirection))
			
			roomDirections.erase(randomDirection)
	
	saveRooms()
	
	roomsGrid[gridLayout] = {
		"room" : room,
		"doors" : doors
	}
	
		
	createdRooms += 1

	return room

func _ready():

	var save = load("user://lastDungeon.tscn")
	
	if save == null:
		randomize()
		var firstRoom = create_room(Vector2.ZERO, null)
		playerRoom = firstRoom
	else:

		get_tree().get_current_scene().queue_free()
		
		get_tree().change_scene(save)
		print(get_tree().get_current_scene())
		

func recreateDungeonBySave(savedData, playerRoomData):
	
	roomsGrid = savedData
	playerRoom = playerRoomData
	
	for grid in roomsGrid:
		var room = roomsGrid[grid].room
		room.instance()
		add_child(room)
		room.position = Vector2(0, 0)
	
	
func saveRooms():
	
	var packed_scene = PackedScene.new()
	packed_scene.pack(get_tree().get_current_scene())
	ResourceSaver.save("user://lastDungeon.tscn", packed_scene)
	print("SAVED!")
