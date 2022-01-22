extends KinematicBody2D

onready var AI = $AI
onready var weapon = $Weapon
export var maxHealth = 5
onready var health = maxHealth

func _ready():
	AI.initialize(self, weapon)
	$HPBar.value = 100

func _process(delta):
	if health < 0 or health == 0:
#		$AI.state = 3
		queue_free()
		# TODO Cambia allo stato DEAD e far partire animazione e suono di morte e tutto
