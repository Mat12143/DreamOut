extends Node2D
export (Array, PackedScene) var weapons
export (PackedScene) var bullet = preload("res://scenes/bullets/EnemyBullet.tscn")
export (PackedScene) var ai = preload("res://scenes/ais/StaticAI.tscn")

func _ready():
	for i in weapons:
		var w = i.instance()
		$Weapons.add_child(w)
	var aiInst = ai.instance()
	add_child(aiInst)
	aiInst.initialize(owner, weapons) # TODO adattare le AI per il cambiamento all'array di armi
