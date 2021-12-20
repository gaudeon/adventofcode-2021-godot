extends Node2D

signal move_forward
signal move_up
signal move_down

var file_location = "res://day_2/day2_input.real.tres"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var data = _load_file().split("\n",false)
	for i in range(data.size()):
		print(data[i])
		var pair = data[i].split(" ",false)
		var command = pair[0]
		var amount = pair[1] as int

		if(command == "forward"):
			emit_signal("move_forward", amount)
		elif(command == "down"):
			emit_signal("move_down", amount)
		elif(command == "up"):
			emit_signal("move_up", amount)

func _load_file():
	var fileio = load("res://shared/fileio.gd").new()
	return fileio.load_file(file_location)
