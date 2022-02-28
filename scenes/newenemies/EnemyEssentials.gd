extends Node2D

export var _c_attacksAndWeapons = 0
export (Array, PackedScene) var weapons
export (bool) var shuffleAttacks = false

export var _c_Bullet = 0
export (PackedScene) var bullet = preload("res://scenes/bullets/EnemyBullet.tscn")
export (Color) var bulletModulate = Color("ff0000")
export (int) var bulletSpeed = 350
export (float) var bulletDamage = 0.5

export var _c_aiAndLogic = 0
export (PackedScene) var ai = preload("res://scenes/ais/StaticAI.tscn")
export var maxHealth = 5

export var _c_resources = 0
export (AudioStream) var shootSound = preload("res://sfx/shoot.mp3")
export (AudioStream) var hurtSound = preload("res://sfx/enemyHurt.wav")

onready var health = maxHealth
var hitFromShotGun = false
var toTweenOrNotToTween = true
var invincible = false
onready var blood = preload("res://scenes/particles/EnemyDeath.tscn")
onready var animationPlayer = owner.get_node("AnimationPlayer")
onready var animationTree = owner.get_node("AnimationTree")
onready var animationState = animationTree.get("parameters/playback")

func _ready():
	$HPBar.value = 100
	$HurtSound.stream = hurtSound
	$ShootSound.stream = shootSound
	for i in weapons:
		var w = i.instance()
		$Weapons.add_child(w)
		w.Bullet = bullet
		w.bulletDamage = bulletDamage
		w.bulletSpeed = bulletSpeed
		w.bulletModulate = bulletModulate
	var aiInst = ai.instance()
	add_child(aiInst)
	aiInst.initialize(owner, $Weapons, shuffleAttacks) # TODO adattare le AI per il cambiamento all'array di armi

func _process(delta):
	if health < 0 or health == 0:
		$HPBar.hide()
		$AI.set_state(3)
		owner.get_node("AnimationPlayer").stop()
		if owner.get_node("AnimationPlayer").has_animation("RESET"): $AnimationPlayer.play("RESET")
		if (toTweenOrNotToTween):
			var b = blood.instance()
			owner.owner.add_child(b)
			b.transform = owner.transform
			$Tween.interpolate_property(
				owner, "modulate", Color('ffffff'), Color('00ffffff'), 0.3
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
	owner.queue_free()
