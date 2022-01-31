extends Area2D

var interactable = false
onready var interactor = get_node("Indicator")
var menuOpened = false
onready var openedEye = preload("res://sprites/NPCs/Spawn/Dungeoner_open_eye.png")
onready var normal = preload("res://sprites/NPCs/Spawn/Dungeoner.png")

func openDungeonMenu():
	menuOpened = true
	get_node("EnterDungeonGUI/GUI").visible = true
	get_node("NPC").texture = openedEye
func closeDungeonMenu():
	menuOpened = false
	get_node("EnterDungeonGUI/GUI").visible = false
	get_node("NPC").texture = normal

func _input(input):
	if (input.is_action_pressed("npc_interact") and interactable and menuOpened == false):
		openDungeonMenu()
		
	elif (menuOpened && input.is_action_pressed("npc_interact")):
		closeDungeonMenu()

func _on_Dungeon_NPC_body_entered(body):
	if (body.name == "Player"):
		interactable = true
	
func _on_Dungeon_NPC_body_exited(body):
	if (body.name == "Player"):
		interactable = false
	
	if (menuOpened and body.name == "Player"):
		closeDungeonMenu()

func _physics_process(delta):
	interactor.visible = interactable
