extends Node

export var maxCharges := 1
var charges = maxCharges
export var cooldown := 10 # In secondi
export var ephemeral := false

onready var consumData = {
	"maxCharges": maxCharges,
	"charges": charges,
	"cooldown": cooldown,
	"ephemeral": ephemeral
}
