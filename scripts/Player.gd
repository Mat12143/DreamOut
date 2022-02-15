extends KinematicBody2D

export var acceleration = 50
export var max_speed = 15
export var friction = 10000
export var fireDelay:float = 0.1
#export var rollDelay:float = 1
var maxHealth = 10
var health = maxHealth
onready var fireDelayTimer = $FireDelayTimer
onready var rollDelayTimer = $RollDelayTimer
onready var bomb = preload("res://scenes/bullets/Bomb.tscn")
onready var bulletShell = preload("res://scenes/BulletShell.tscn")
onready var event = get_tree().current_scene.get_node("GlobalEventManager")
onready var gunSounds = [
	preload("res://sfx/projectilehit.wav"),
	preload("res://sfx/projectilehit.wav"),
	preload("res://sfx/shotgun.wav"),
	preload("res://sfx/projectilehit.wav"),
	preload("res://sfx/sniper.wav"),
	preload("res://sfx/projectilehit.wav"),
]

enum Guns {
	SMG, # 0
	PISTOL, # 1
	SHOTGUN, # 2
	ROCKET, # 3
	RIFLE, # 4
	PYROS # 5, dev only
}
export (PackedScene) var Bullet

var data = { # Questo verra' salvato
	"upgrades": {
		"damage": 0,
		"fireRate": 0,
		"projSpeed": 0,
		"charSpeed": 0,
		"gunRange": 0,
		"maxHealth": 0,
		"accuracy": 0,
	},
	"settings": {
		"screenShake": true
	},
	"inventory": [],
	"consumable": "",
	"dev": false,
	"bombs": 0,
	"keys": 0,
	"health": maxHealth,
	"selectedGun": Guns.SMG, # Viene salvato come numero (ENUM GUNS)
	"name": "Player"
}
var baseData = data.duplicate()

var gunData = {
	"damage": 0,
	"fireRate": 0,
	"projSpeed": 0,
	"charSpeed": 0,
	"gunRange": 0,
	"power": 0,
	"spread": 0,
	"autoFire": true,
}

var loadInv = {}

var modifiers = {
	"damagedByExplosions": true
}
var consumable
var consumData = {
	"charges": 0,
	"maxCharges": 0,
	"cooldown": 0,
	"ephemeral": false
} # NON USARE ?????

func getFireRate():
	var upgradeFireRate = (float(data.upgrades.fireRate) / 100)
#			print([float(gunData.fireRate), upgradeFireRate])
	var fireRate = gunData.fireRate - upgradeFireRate
	if (fireRate <= 0):
		fireRate = 0.05
	return fireRate

func updateGun():
	match data.selectedGun:
		Guns.SMG:
			gunData.damage = 1
			gunData.fireRate = 0.2
			gunData.projSpeed = 500
			gunData.autoFire = true
			gunData.gunRange = 40
			gunData.power = 0
			gunData.spread = 15
		Guns.PISTOL:
			gunData.damage = 1
			gunData.fireRate = 0.1
			gunData.projSpeed = 500
			gunData.autoFire = false
			gunData.gunRange = 25
			gunData.power = 0
			gunData.spread = 5
		Guns.SHOTGUN:
			gunData.damage = 0.5
			gunData.fireRate = 1
			gunData.projSpeed = 500
			gunData.autoFire = true
			gunData.gunRange = 20
			gunData.power = 4
			gunData.spread = 0
		Guns.ROCKET:
			gunData.damage = 5
			gunData.fireRate = 2
			gunData.projSpeed = 250
			gunData.autoFire = true
			gunData.gunRange = 50
			gunData.power = 0
			gunData.spread = 0
		Guns.RIFLE:
			gunData.damage = 4
			gunData.fireRate = 1.5
			gunData.projSpeed = 1500
			gunData.autoFire = true
			gunData.gunRange = 1000
			gunData.power = 3
			gunData.spread = 0
			$ShootSound.volume_db = 15
		Guns.PYROS:
			gunData.damage = 99
			gunData.fireRate = 0.000000001
			gunData.projSpeed = 1500
			gunData.gunRange = 1000
			gunData.power = 0
			gunData.spread = 0
			gunData.autoFire = false
		_:
			print("NO GUN FOUND")
	$Gun/Sprite.frame = data.selectedGun
	$ShootSound.stream = gunSounds[data.selectedGun]

func _ready():
	get_tree().current_scene.get_node("DynamicTooltip").initialize("Aaaaaaaaaaaaaaaa", "e")
	# --- Salvataggi ---
	var save = owner.get_node("SaveManager").loadSave("user://plr.save")
	if !!save:
		for i in data.keys():
			if !save.has(i):
				save[i] = data[i]
		data = save
			
	else:
		print('plr.save not found, loading defaults')
		owner.get_node("SaveManager").save(data, "user://plr.save")
	updateGun()
	
	# --- Esegui restart su ogni oggetto nell'inventario ---
	var itemDB = get_tree().current_scene.get_node("ItemDB")
	for i in data.inventory:
		var item = itemDB.items[i]
		loadInv[i] = item
		item.get_node("Logic").restart(self)
	if data.consumable != '':
		consumable = itemDB.items[data.consumable]
		consumable.get_node("Logic").restart(self)
		consumable.get_node("ItemEssentials/CollisionShape2D").disabled = true
		$Items.add_child(consumable)
		consumable.get_node("Sprite").hide()
#	add_child()

var velocity = Vector2.ZERO
onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

func shoot():
#	var t = $GunRecoil
#	t.interpolate_property($Gun/Sprite, "rotation", $Gun/Sprite.rotation, $Gun/Sprite.rotation - deg2rad(-35 if $Gun/Sprite.rotation_degrees < 0 else 35), (getFireRate()/4))
#	t.start()
	event.emit_signal("shake", 0.2, 7* gunData.power, 1 * gunData.power, 0)	
	if data.selectedGun != Guns.SHOTGUN:
		var b = Bullet.instance()
		b.initialize(gunData.damage + data.upgrades.damage, gunData.projSpeed + data.upgrades.projSpeed, data.selectedGun, gunData.gunRange + data.upgrades.gunRange)
		get_tree().current_scene.add_child(b)
		b.transform = $Gun/Position2D.global_transform
		var spread = gunData.spread - data.upgrades.accuracy
		if spread < 0:
			spread = 0
		b.rotation += deg2rad(rand_range(-spread, spread))
		$ShootSound.play()
		
#		var sh = bulletShell.instance()
#		get_tree().current_scene.add_child(sh)
#		sh.position = $Gun.global_position
#		sh.rotation = deg2rad(rand_range(0, 360))
	else:
		for i in $Gun/ShotGuns.get_children():
			var b = Bullet.instance()
			b.initialize(gunData.damage + data.upgrades.damage, gunData.projSpeed + data.upgrades.projSpeed, data.selectedGun, gunData.gunRange + data.upgrades.gunRange)
			get_tree().current_scene.add_child(b)
			b.transform = i.global_transform
			var spread = gunData.spread - data.upgrades.accuracy
			if spread < 0:
				spread = 0
			b.rotation += deg2rad(rand_range(-spread, spread))
		$ShootSound.play()
	
	
func _physics_process(delta):
#	print(position)
	if !owner.get_node("HUD/ChatBox/VBoxContainer/LineEdit").is_visible() and health > 0:
		var input_vector = Vector2.ZERO
		input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
		input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
		input_vector = input_vector.normalized()
		if input_vector != Vector2.ZERO:
			animationTree.set("parameters/Idle/blend_position", input_vector)
			animationTree.set("parameters/Walk/blend_position", input_vector)
			animationState.travel("Walk")
			velocity = velocity.move_toward(input_vector * max_speed, acceleration * delta)
		else:
			animationState.travel("Idle")
			velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
		
		velocity = move_and_slide(velocity)
		
		var pressedShoot = Input.is_action_pressed("shoot") if gunData.autoFire else Input.is_action_just_pressed("shoot")
		if pressedShoot and fireDelayTimer.is_stopped():
			var fireRate = getFireRate()
			fireDelayTimer.start(fireRate)
			shoot()
		if Input.is_action_just_pressed("bomb") and data.bombs > 0:
			var b = bomb.instance()
			get_tree().current_scene.add_child(b)
			b.position = position
			data.bombs -= 1
			get_tree().current_scene.get_node("HUD").updateHud()
			
		if Input.is_action_just_pressed("consumable") and consumable and consumable.get_node("ConsumData").charges > 0:
			var logic = consumable.get_node("Logic")
			var consumDict = consumable.get_node("ConsumData")
			logic.use(self)
			consumDict.charges -= 1

func _on_GlobalEventManager_playerHit(damage):
	event.emit_signal("shake", 0.1, 20, 5 if damage == 0.5 else 10, 0)	
	if $IFrameTimer.is_stopped() and !data.dev:
		$IFrameTimer.start(1)
		data.health -= damage
		$HitSound.play()
		for _i in range(0, 10):
			yield(get_tree().create_timer(0.1), "timeout")
			if visible:
				hide()
			else:
				show()


func _on_GlobalEventManager_upgradePickedUp(key, value):
#	print("ASASD")
	data.upgrades[key] += value
	if key == "maxHealth":
		get_tree().current_scene.get_node("HUD").updateHealth()
		data.health = clamp(data.health, 0, maxHealth + data.upgrades.maxHealth)
#	get_tree().current_scene.get_node("GlobalEventManager").emit_signal("messageEntered", "Upgrade", "%s + %s" % [key, String(value)])


func _on_GlobalEventManager_playerHeal(value):
	data.health = clamp(data.health + value, 0, maxHealth + data.upgrades.maxHealth)
	get_tree().current_scene.get_node("HUD").updateHealth()


func _on_GunRecoil_tween_completed(object, key):
#	return
	$GunRecoil2.interpolate_property($Gun/Sprite, "rotation", $Gun/Sprite.rotation, $Gun/Sprite.rotation + deg2rad(35 if $Gun/Sprite.rotation_degrees < 0 else -35), (getFireRate()/4) * 3)
	$GunRecoil2.start()
