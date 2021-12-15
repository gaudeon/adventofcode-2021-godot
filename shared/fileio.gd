extends Node



func load_file(file):
	var f = File.new()
	
	f.open(file, File.READ)
	var text = f.get_as_text()
	f.close()
	
	return text
