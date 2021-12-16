extends "res://addons/gut/test.gd"

var fileio = load("res://shared/fileio.gd").new()

func test_load_file():
	var mockFile = MockFile.new()
	fileio.load_file("asdf", mockFile)
	
	assert_true(mockFile.open_called, "fileio.load_file called File.open")
	assert_true(mockFile.get_as_text_called, "fileio.load_file called File.get_as_text")
	assert_true(mockFile.close_called, "fileio.load_file called File.close")
	
class MockFile:
	extends Reference
	
	var open_called = false
	var get_as_text_called = false
	var close_called = false
	
	var READ = 1
	
	func open(_file, _mode):
		open_called = true
		
	func get_as_text():
		get_as_text_called = true

	func close():
		close_called = true
	
	
