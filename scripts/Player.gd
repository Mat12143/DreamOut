extends KinematicBody2D

export var acceleration = 500
export var max_speed = 100
export var friction = 900
export var fireDelay:float = 0.1
#export var rollDelay:float = 1
export var maxHealth = 10
var health = maxHealth
onready var fireDelayTimer = $FireDelayTimer
onready var rollDelayTimer = $RollDelayTimer

export (PackedScene) var Bullet

var velocity = Vector2.ZERO
onready var animationPlayer = $AnimationPlayer

func shoot():
	var b = Bullet.instance()
	owner.add_child(b)
	b.transform = $Gun/Position2D.global_transform
	$ShootSound.play()
		

func _physics_process(delta):
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
	
	if Input.is_action_pressed("shoot") and fireDelayTimer.is_stopped():
		fireDelayTimer.start(fireDelay)
		shoot()
