extends Reference

func load_file(file_location, fileObj = File.new()):
	fileObj.open(file_location, fileObj.READ)
	var text = fileObj.get_as_text()
	fileObj.close()
	
	return text
