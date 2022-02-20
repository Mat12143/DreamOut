extends KinematicBody2D

# == EXPORTS ==
export var acceleration = 50
export var max_speed = 15
export var friction = 10000
export var fireDelay:float = 0.1

# == HEALTH ==
var maxHealth = 10
var health = maxHealth

# == TIMERS ==
onready var fireDelayTimer = $FireDelayTimer
onready var rollDelayTimer = $RollDelayTimer

# == PRELOADS ==
onready var bomb = preload("res://scenes/bullets/Bomb.tscn")
onready var bulletShell = preload("res://scenes/BulletShell.tscn")
export (PackedScene) var Bullet

# == ANIMATIONS ==
onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

# == UTILS ==
onready var event = get_tree().current_scene.get_node("GlobalEventManager")
onready var current = get_tree().current_scene

# == CONSTANTS and ENUMS ==
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

# == DATA AND INVENTORIES ==
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
	"name": "Player",
	"damageReason": "idk"
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

remotesync func updateGun():
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
	rpc("remoteUpdateGunVisuals", data)

remote func remoteUpdateGunVisuals(currentData):
	yield(get_tree().create_timer(0.05), "timeout")
	$Gun/Sprite.frame = data.selectedGun
	$ShootSound.stream = gunSounds[data.selectedGun]

func init(nickname:String, start_position, is_slave):
	nickname = nickname.strip_edges()#.substr(0, 16)
	data.name = nickname
	$GUI/Nickname.text = nickname
	global_position = start_position
	if is_slave:
#		$GUI/Nickname.rect_size = $GUI/Nickname.get_font("font").get_string_size($GUI/Nickname.text)
		$GUI/Nickname.show()

func _ready():
	if name != "Player" and is_network_master():
		print_debug("Gordo")
		print(data.name)
		get_parent().get_node("HUD").inject(self)
		get_parent().get_node("HUD").updateHud()
		get_parent().get_node("HUD/ChatBox").inject(self)
		get_parent().get_node("CommandManager").inject(self)
		get_parent().get_node("GlobalEventManager").inject(self)
		get_parent().get_node("DungeonSpawn").inject(self)
		
	else:
		print_debug("NO GORDO")
#	get_parent().get_node("HUD/ChatBox").inject(self)
	
	
	
	event.connect("playerHit", self, "_on_GlobalEventManager_playerHit")
	event.connect("playerHeal", self, "_on_GlobalEventManager_playerHeal")
	event.connect("upgradePickedUp", self, "_on_GlobalEventManager_upgradePickedUp")
	
	current.get_node("DynamicTooltip").initialize("Aaaaaaaaaaaaaaaa", "e")
	# --- Salvataggi ---
#	var save = SaveManager.loadSave("user://plr.save")
#	if !!save:
#		for i in data.keys():
#			if !save.has(i):
#				save[i] = data[i]
#		data = save
#
#	else:
#		print('plr.save not found, loading defaults')
#		SaveManager.save(data, "user://plr.save")
	rpc("updateGun")
	
	# --- Esegui restart su ogni oggetto nell'inventario ---
	var itemDB = current.get_node("ItemDB")
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

var velocity = Vector2.ZERO
puppet var slave_position = Vector2()

func _physics_process(delta):
	
#	print(position)
	if name != "Player":
		rpc("updateSmallGUI")
		if is_network_master():
			if !current.get_node("HUD/ChatBox/VBoxContainer/LineEdit").is_visible():
	#			var clampedGozzo = Vector2(
	#	#			get_global_mouse_position().x / 160,
	#	#			get_global_mouse_position().y / 90
	#				rad2deg($AnimationPointer.global_rotation) / 180,
	#				rad2deg($AnimationPointer.global_rotation) / 180
	#			) # USARE ROTAAZIONE DI ANIMATIONPOINTER
	#	#		print(clampedGozzo)
	#			animationTree.set("parameters/Idle/blend_position", clampedGozzo)
	#			animationTree.set("parameters/Walk/blend_position", clampedGozzo)
				
				var input_vector = Vector2.ZERO
				input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
				input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
				input_vector = input_vector.normalized()
				if input_vector != Vector2.ZERO:
	#				animationState.travel("Walk")
					velocity = velocity.move_toward(input_vector * max_speed, acceleration)
				else:
					animationState.travel("Idle")
					velocity = velocity.move_toward(Vector2.ZERO, friction)
					
				
				
				velocity = move_and_slide(velocity)
				
				var pressedShoot = Input.is_action_pressed("shoot") if gunData.autoFire else Input.is_action_just_pressed("shoot")
				if pressedShoot and fireDelayTimer.is_stopped():
#					event.emit_signal("playerHit", 0.5)
					var fireRate = getFireRate()
					fireDelayTimer.start(fireRate)
					rpc("shoot")
				if Input.is_action_just_pressed("bomb") and data.bombs > 0:
					var b = bomb.instance()
					current.add_child(b)
					b.position = position
					data.bombs -= 1
					current.get_node("HUD").updateHud()
				if Input.is_action_just_pressed("consumable") and consumable and consumable.get_node("ConsumData").charges > 0:
					var logic = consumable.get_node("Logic")
					var consumDict:ConsumData = consumable.get_node("ConsumData")
					logic.use(self)
					consumDict.charges -= 1
			if float(data.health) <= 0:
				event.emit_signal("dead", self)
				event.emit_signal("messageEntered", data.name, "[color=red]%s was killed by %s[/color]" % [data.name, data.damageReason], {"hideAuthor": true})
				rpc("die")
			rset_unreliable('slave_position', position)

		else: # Puppet code
			position = slave_position

		if get_tree().is_network_server():
	#		print(name)
			if name != "Player":
				Network.update_position(int(name), position)
		
# ===== REMOTES =====
remotesync func updateSmallGUI():
	# """HEALTHBAR"""
	var healthPercent = (float(data.health) / (maxHealth + data.upgrades.maxHealth)) * 100
	if healthPercent > 75:
		$GUI/Nickname.add_color_override("font_color", "FFFFFF")
	elif healthPercent > 50:
		$GUI/Nickname.add_color_override("font_color", "c6bc4a")
	elif healthPercent > 25:
		$GUI/Nickname.add_color_override("font_color", "ff8900")
	else:
		$GUI/Nickname.add_color_override("font_color", "ff0000")
remotesync func shoot():
#	var t = $GunRecoil
#	t.interpolate_property($Gun/Sprite, "rotation", $Gun/Sprite.rotation, $Gun/Sprite.rotation - deg2rad(-35 if $Gun/Sprite.rotation_degrees < 0 else 35), (getFireRate()/4))
#	t.start()
	event.emit_signal("shake", 0.2, 7* gunData.power, 1 * gunData.power, 0)	
	if data.selectedGun != Guns.SHOTGUN:
		var b = Bullet.instance()
		b.initialize(gunData.damage + data.upgrades.damage, gunData.projSpeed + data.upgrades.projSpeed, data.selectedGun, gunData.gunRange + data.upgrades.gunRange, self)
		current.add_child(b)
		b.transform = $Gun/Position2D.global_transform
		var spread = gunData.spread - data.upgrades.accuracy
		if spread < 0:
			spread = 0
		b.rotation += deg2rad(rand_range(-spread, spread))
		$ShootSound.play()
		
#		var sh = bulletShell.instance()
#		current.add_child(sh)
#		sh.position = $Gun.global_position
#		sh.rotation = deg2rad(rand_range(0, 360))
	else:
		for i in $Gun/ShotGuns.get_children():
			var b = Bullet.instance()
			b.initialize(gunData.damage + data.upgrades.damage, gunData.projSpeed + data.upgrades.projSpeed, data.selectedGun, gunData.gunRange + data.upgrades.gunRange, self)
			current.add_child(b)
			b.transform = i.global_transform
			var spread = gunData.spread - data.upgrades.accuracy
			if spread < 0:
				spread = 0
			b.rotation += deg2rad(rand_range(-spread, spread))
		$ShootSound.play()
remotesync func damageSynced(damage, _name):
	if $IFrameTimer.is_stopped() and !data.dev:
		event.emit_signal("shake", 0.1, 20, 5 if damage == 0.5 else 10, 0)	
		$IFrameTimer.start(1)
		data.health -= damage
		if damage == 0.5: $Sounds/HitSound.play()
		elif damage == 1: $Sounds/HitSound.play() # TODO suono apposta
#		if float(health) > 0:
		for _i in range(0, 10):
			yield(get_tree().create_timer(0.1), "timeout")
			if visible:
				hide()
			else:
				show()
remotesync func die():
	$Gun.hide()
	set_physics_process(false)
#	hide()
	$HitBox.disabled = true
	yield(get_tree().create_timer(0.1), "timeout")
	animationState.travel("Death")

# ===== SIGNALS =====		
func _on_GlobalEventManager_playerHit(damage, _name, reason = "the unknown"):
	if _name == name:
		data.damageReason = reason
		rpc("damageSynced", damage, _name)
					
func _on_GlobalEventManager_upgradePickedUp(key, value):
#	print("ASASD")
	data.upgrades[key] += value
	if key == "maxHealth":
		current.get_node("HUD").updateHealth()
		data.health = clamp(data.health, 0, maxHealth + data.upgrades.maxHealth)

func _on_GlobalEventManager_playerHeal(value):
	data.health = clamp(data.health + value, 0, maxHealth + data.upgrades.maxHealth)
	current.get_node("HUD").updateHealth()

func _on_GunRecoil_tween_completed(object, key):
#	return
	$GunRecoil2.interpolate_property($Gun/Sprite, "rotation", $Gun/Sprite.rotation, $Gun/Sprite.rotation + deg2rad(35 if $Gun/Sprite.rotation_degrees < 0 else -35), (getFireRate()/4) * 3)
	$GunRecoil2.start()
