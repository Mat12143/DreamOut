extends Node2D

enum State {
	PATROL,
	ENGAGE
}

signal state_changed(new_state)

onready var playerDetectionZone = $PlayerDetection
onready var fireDelayTimer = $FireDelayTimer
var state = State.PATROL setget set_state
var player = null
var actor = null
var weapon = null
export var speed = 10
export var fireDelay = 1.2

func initialize(actor, weapon):
	self.actor = actor
	self.weapon = weapon

func _physics_process(delta):
	match state:
		State.PATROL:
			pass
		State.ENGAGE:
			if player != null and weapon != null:
#				print(player, actor, weapon)
#				actor.look_at(player.global_position)
				var velocity = actor.global_position.direction_to(player.global_position)
				actor.move_and_collide(velocity * speed * delta)
				if fireDelayTimer.is_stopped():
					fireDelayTimer.start(fireDelay)
					weapon.shoot(player)
				
			else:
				print('Engaging, but missing weapon or player')
		_:
			print('unknown state!')
				

func set_state(new_state: int):
	if new_state == state:
		return
	state = new_state
	emit_signal("state_changed", state)
	
func _on_PlayerDetection_body_entered(body: Node):
	if body.is_in_group("Player"):
		set_state(State.ENGAGE)
		player = body

func _on_PlayerDetection_body_exited(body):
	if body.is_in_group("Player"):
		set_state(State.PATROL)
		player = body
