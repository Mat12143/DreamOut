extends KinematicBody2D

onready var AI = $AI
onready var weapon = $Weapon
export var maxHealth = 5
onready var health = maxHealth
var hitFromShotGun = false
var toTweenOrNotToTween = true
var invincible = false

func _ready():
	AI.initialize(self, weapon)
	$HPBar.value = 100

func _process(_delta):
	if health < 0 or health == 0:
		$HPBar.hide()
		$AI.set_state(3)
		$AnimationPlayer.stop()
		if $AnimationPlayer.has_animation("RESET"): $AnimationPlayer.play("RESET")
		if (toTweenOrNotToTween):
			$Tween.interpolate_property(
				self, "modulate", Color('ffffff'), Color('00ffffff'), 0.3
			)
			$Tween.start()
		toTweenOrNotToTween = false
#		$AI.state = 3
#		$AnimationPlayer.play("Death")
#		$DeleteCorpse.set_wait_time(1)
#		$DeleteCorpse.start()
#		while true:
#			if $DeleteCorpse.is_stopped():
#				break
		
		
		# TODO Cambia allo stato DEAD e far partire animazione e suono di morte e tutto


func _on_Tween_tween_completed(object, key):
	queue_free()
	
	
