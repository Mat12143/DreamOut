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
	"damage": 0,
	"fireRate": 0,
	"projSpeed": 0,
	"charSpeed": 0,
	"autoFire": true,
	"selectedGun": Guns.PYROS, # Viene salvato come numero (ENUM GUNS)
	"name": "Player"
}

func _ready():
	match data.selectedGun:
		Guns.SMG:
			data.damage = 1
			data.fireRate = 0.2
			data.projSpeed = 500
		Guns.PISTOL:
			data.damage = 0.5
			data.fireRate = 0.00001
			data.projSpeed = 500
			data.autoFire = false
		Guns.SHOTGUN:
			data.damage = 0.7
			data.fireRate = 1
			data.projSpeed = 500
		Guns.RIFLE:
			data.damage = 4
			data.fireRate = 1.5
			data.projSpeed = 1500
		Guns.PYROS:
			data.damage = 100
			data.fireRate = 0.000000001
			data.projSpeed = 1500
		_:
			print("NO GUN FOUND")
	$Gun.frame = data.selectedGun
	
#		data.charSpeed

var velocity = Vector2.ZERO
onready var animationPlayer = $AnimationPlayer

func shoot():
	if data.selectedGun != Guns.SHOTGUN:
		var b = Bullet.instance()
		b.initialize(data.damage, data.projSpeed, data.selectedGun)
		get_tree().current_scene.add_child(b)
		b.transform = $Gun/Position2D.global_transform
		$ShootSound.play()
	else:
		for i in $Gun/ShotGuns.get_children():
			var b = Bullet.instance()
			b.initialize(data.damage, data.projSpeed, data.selectedGun)
			get_tree().current_scene.add_child(b)
			b.transform = i.global_transform
		$ShootSound.play()
	
func _physics_process(delta):
#	print(position)
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	if input_vector != Vector2.ZERO:
		animationPlayer.play("Walk")
		velocity = velocity.move_toward(input_vector * max_speed, acceleration * delta)
	else:
		animationPlayer.play("RESET")
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	
	velocity = move_and_slide(velocity)
	
	var pressedShoot = Input.is_action_pressed("shoot") if data.autoFire else Input.is_action_just_pressed("shoot")
	if pressedShoot and fireDelayTimer.is_stopped():
		fireDelayTimer.start(data.fireRate)
		shoot()

func _on_GlobalEventManager_playerHit(damage):
	if $IFrameTimer.is_stopped():
		$IFrameTimer.start(0.5)
		health -= damage
		$HitSound.play()
		for i in range(0, 10):
			yield(get_tree().create_timer(0.05), "timeout")
			if visible:
				hide()
			else:
				show()
