extends Node2D

func loadSave(path):
#	print("Loading save")
	var file = File.new()
	if not file.file_exists(path):
		return false
	file.open_encrypted_with_pass(path, File.READ, "pyrosGiuroSpaccoTuttoBananoide1nsdf89123m")
	var save = file.get_var()
	file.close()
	return save
	
func save(save, path):
#	print("Saving")
	var file = File.new()
	file.open_encrypted_with_pass(path, File.WRITE, "pyrosGiuroSpaccoTuttoBananoide1nsdf89123m")	
	file.store_var(save)
	file.close()
