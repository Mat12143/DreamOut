extends CanvasLayer

onready var heart = preload("res://scenes/Heart.tscn")

func updateHealth():
	var body = get_parent().get_node("Player")
	var totalMaxHealth = (body.maxHealth + body.data.upgrades.maxHealth)
	var fulls = clamp(floor(body.data.health), 0, totalMaxHealth)
	var empties = totalMaxHealth - fulls
	var half = body.data.health - fulls == 0.5
	var index = 0
	
	print([body.data.health, [fulls, empties, half]])
	
	if ($Health.get_child_count() < totalMaxHealth):
		for _i in range(totalMaxHealth - $Health.get_child_count()):
			var hl = heart.instance()
			$Health.add_child(hl)
	elif ($Health.get_child_count() > totalMaxHealth):
		for i in range($Health.get_child_count() - totalMaxHealth):
			$Health.get_children()[i].queue_free()
	
	for _i in fulls:
		$Health.get_children()[index].get_node("Sprite").frame = 0
		index += 1
	for _i in empties:
		$Health.get_children()[index].get_node("Sprite").frame = 2
		index += 1
	
	if half: $Health.get_children()[fulls].get_node("Sprite").frame = 1
	
	# TODO Gestire cambiamenti di vita BLU (temporanea) e vita massima	
	
	
#func updateHealth():
#	var body = get_parent().get_node("Player")
#	var fulls = clamp(floor(body.data.health), 0, 10)
#	var totalMaxHealth = (body.maxHealth + body.data.upgrades.maxHealth)
#	var empties = totalMaxHealth - fulls
#	var half = body.data.health - fulls == 0.5
#	var index = 0
#
#	print([body.data.health, [fulls, empties, half]])
#
#	if ($Health.get_child_count() != totalMaxHealth):
#		for _i in range(totalMaxHealth - $Health.get_child_count()):
#			var hl = heart.instance()
#			$Health.add_child(hl)
#
#	for _i in fulls:
#		$Health.get_children()[index].get_node("Sprite").frame = 0
#		index += 1
#	print(index)
#	if half:
#		$Health.get_children()[index].get_node("Sprite").frame = 1
#		index += 1
#	print(index)
##	else: index -= 1
#	for _i in clamp(empties - 1, 1, empties):
#		$Health.get_children()[index].get_node("Sprite").frame = 2
#		index += 1
#	print(index)
	
#	print([body.data.health, fulls, empties, half])
#	for i in range(body.data.health)

func _ready():
	updateHealth()
#	var body = get_parent().get_node("Player")
#	$PortraitAndHealth/Portrait/HPBar.value = (float(body.data.health) / (body.maxHealth + body.data.upgrades.maxHealth) * 100)

func _on_GlobalEventManager_playerHit(_damage):
	updateHealth()
#	var body = get_parent().get_node("Player")
#
#	$PortraitAndHealth/Portrait/HPBar.value = (float(body.data.health) / (body.maxHealth + body.data.upgrades.maxHealth) * 100)
