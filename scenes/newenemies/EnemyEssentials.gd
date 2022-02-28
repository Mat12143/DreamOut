extends Node2D
export (Array, PackedScene) var weapons
export (bool) var shuffleAttacks = false
export (PackedScene) var bullet = preload("res://scenes/bullets/EnemyBullet.tscn")
export (PackedScene) var ai = preload("res://scenes/ais/StaticAI.tscn")
export var maxHealth = 5

onready var health = maxHealth
var hitFromShotGun = false
var toTweenOrNotToTween = true
var invincible = false
onready var blood = preload("res://scenes/particles/EnemyDeath.tscn")

func _ready():
	$HPBar.value = 100
	for i in weapons:
		var w = i.instance()
		$Weapons.add_child(w)
	var aiInst = ai.instance()
	add_child(aiInst)
	aiInst.initialize(owner, weapons, shuffleAttacks) # TODO adattare le AI per il cambiamento all'array di armi
