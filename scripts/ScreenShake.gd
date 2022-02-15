extends Node

var amplitude = 0
const TRANS = Tween.TRANS_SINE
const EASE = Tween.EASE_IN_OUT
onready var camera = get_parent()

var priority = 0

func start(duration = 0.2, frequency = 15, amplitude = 3, priority = 0):
#	if owner.get_node("Player").data.settings.screenShake: # TODO
		if priority >= self.priority and frequency != 0:
			self.priority = priority
			self.amplitude = amplitude
			$Duration.wait_time = duration
			$Frequency.wait_time = 1 / float(frequency)
			$Duration.start()
			$Frequency.start()
			_new_shake()
	
func _new_shake():
	var rand = Vector2()
	rand.x = rand_range(-amplitude, amplitude)
	rand.y = rand_range(-amplitude, amplitude)

	$Tween.interpolate_property(camera, "offset", camera.offset, rand, $Frequency.wait_time, TRANS, EASE)
	$Tween.start()

func _reset():
	$Tween.interpolate_property(camera, "offset", camera.offset, Vector2(), $Frequency.wait_time, TRANS, EASE)
	$Tween.start()
	priority = 0

func _on_Frequency_timeout():
	_new_shake()


func _on_Duration_timeout():
	_reset()
	$Frequency.stop()

func _on_GlobalEventManager_shake(duration, frequency, amplitude, priority):
	start(duration, frequency, amplitude, priority)
