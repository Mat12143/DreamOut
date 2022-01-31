extends Node
class_name nanoid

const DEFAULT_LENGTH = 10
const DEFAULT_ALPHABET = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_'
const DEFAULT_RANDOM_SEED = 'a random seed'

export var nanoid_length = DEFAULT_LENGTH
export var nanoid_alphabet = DEFAULT_ALPHABET
export var random_seed = DEFAULT_RANDOM_SEED

var letters = null
var alphabet_length = nanoid_alphabet.length()
var rng = RandomNumberGenerator.new()

var original_seed = null

# Initialize the Nanoid generator
func initialize(use_length:int = DEFAULT_LENGTH, use_alphabet:String = DEFAULT_ALPHABET, use_random_seed = null, random_seed_state = 0) -> void:
	nanoid_length = use_length
	nanoid_alphabet = use_alphabet
	random_seed = use_random_seed
	alphabet_length = nanoid_alphabet.length()
	
	if use_random_seed != null:
		original_seed = random_seed
		rng.seed = hash(random_seed)
		rng.state = random_seed_state
	else:
		rng.randomize()


# Generate a new Nanoid
func nanoid() -> String:
	if original_seed == null:
		rng.randomize()
	var new_id = ""
	for n in nanoid_length:
		new_id += nanoid_alphabet.substr(rng.randi() % alphabet_length, 1)
	return new_id


func get_seed_state():
	return { "seed": original_seed, "state": rng.state }
