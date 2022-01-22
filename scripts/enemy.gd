extends KinematicBody2D

onready var AI = $AI
onready var weapon = $Weapon
export var maxHealth = 5
onready var health = maxHealth
var hitFromShotGun = false

func _ready():
	AI.initialize(self, weapon)
	$HPBar.value = 100

func _process(_delta):
	if health < 0 or health == 0:
#		$AI.state = 3
#		$HPBar.hide()
#		$AnimationPlayer.play("Death")
#		$DeleteCorpse.set_wait_time(1)
#		$DeleteCorpse.start()
#		while true:
#			if $DeleteCorpse.is_stopped():
#				break
		queue_free()
		
		# TODO Cambia allo stato DEAD e far partire animazione e suono di morte e tutto
