extends KinematicBody2D

export var acceleration = 50
export var max_speed = 15
export var friction = 900
export var fireDelay:float = 0.1
#export var rollDelay:float = 1
export var maxHealth = 10
var health = maxHealth
onready var fireDelayTimer = $FireDelayTimer
onready var rollDelayTimer = $RollDelayTimer

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
	},
	"selectedGun": Guns.SMG, # Viene salvato come numero (ENUM GUNS)
	"name": "Player"
} 

var baseData = data.duplicate()

var gunData = {
	"damage": 0,
	"fireRate": 0,
	"projSpeed": 0,
	"charSpeed": 0,
	"autoFire": true,
}

func updateGun():
	match data.selectedGun:
		Guns.SMG:
			gunData.damage = 1
			gunData.fireRate = 0.2
			gunData.projSpeed = 500
			gunData.autoFire = true
		Guns.PISTOL:
			gunData.damage = 1
			gunData.fireRate = 0.00001
			gunData.projSpeed = 500
			gunData.autoFire = false
		Guns.SHOTGUN:
			gunData.damage = 0.7
			gunData.fireRate = 1
			gunData.projSpeed = 500
			gunData.autoFire = true
		Guns.RIFLE:
			gunData.damage = 5
			gunData.fireRate = 1.5
			gunData.projSpeed = 1500
			gunData.autoFire = true
		Guns.PYROS:
			gunData.damage = 100
			gunData.fireRate = 0.000000001
			gunData.projSpeed = 1500
			gunData.autoFire = true
		_:
			print("NO GUN FOUND")
	$Gun.frame = data.selectedGun

func _ready():
	var save = owner.get_node("SaveManager").loadSave("user://plr.save")
	print(save)
	if !!save:
		data = save
	else:
		print('plr.save not found, loading defaults')
		owner.get_node("SaveManager").save(data, "user://plr.save")
	updateGun()

var velocity = Vector2.ZERO
onready var animationPlayer = $AnimationPlayer

func shoot():
	if data.selectedGun != Guns.SHOTGUN:
		var b = Bullet.instance()
		b.initialize(gunData.damage + data.upgrades.damage, gunData.projSpeed + data.upgrades.projSpeed, data.selectedGun)
		get_tree().current_scene.add_child(b)
		b.transform = $Gun/Position2D.global_transform
		$ShootSound.play()
	else:
		for i in $Gun/ShotGuns.get_children():
			var b = Bullet.instance()
			b.initialize(gunData.damage + data.upgrades.damage, gunData.projSpeed + data.upgrades.projSpeed, data.selectedGun)
			get_tree().current_scene.add_child(b)
			b.transform = i.global_transform
		$ShootSound.play()
	
func _physics_process(delta):
#	print(position)
	if !owner.get_node("HUD/ChatBox/VBoxContainer/LineEdit").is_visible():
		var input_vector = Vector2.ZERO
		input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
		input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
		input_vector = input_vector.normalized()
		if input_vector != Vector2.ZERO:
			animationPlayer.play("Walk")
			velocity = velocity.move_toward(input_vector * max_speed, acceleration * delta)
		else:
			animationPlayer.play("RESET")
			velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
		
		velocity = move_and_slide(velocity)
		
		var pressedShoot = Input.is_action_pressed("shoot") if gunData.autoFire else Input.is_action_just_pressed("shoot")
		if pressedShoot and fireDelayTimer.is_stopped():
			var upgradeFireRate = (float(data.upgrades.fireRate) / 100)
#			print([float(gunData.fireRate), upgradeFireRate])
			var fireRate = gunData.fireRate - upgradeFireRate
			if (fireRate <= 0):
				fireRate = 0.05
			fireDelayTimer.start(fireRate)
			shoot()

func _on_GlobalEventManager_playerHit(damage):
	if $IFrameTimer.is_stopped():
		$IFrameTimer.start(0.5)
		health -= damage
		$HitSound.play()
		for _i in range(0, 10):
			yield(get_tree().create_timer(0.05), "timeout")
			if visible:
				hide()
			else:
				show()


func _on_GlobalEventManager_upgradePickedUp(key, value):
	print("ASASD")
	data.upgrades[key] += value
	get_tree().current_scene.get_node("GlobalEventManager").emit_signal("messageEntered", "Upgrade", "%s + %s" % [key, String(value)])
