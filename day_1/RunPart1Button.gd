extends Button

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var data
var increases = 0
var index = 0;
var processing = false;

var file_location = "res://day_1/day1_input.real.tres"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (processing):
		_eval_data(index, index - 1)

		if (index == data.size() - 1):
			processing = false
			get_parent().get_node("StateLabel").text = "Done!"
		else:
			index += 1

func _on_RunButton_pressed():
	if (processing == false):
		get_parent().get_node("Log").text = ""
		get_parent().get_node("StateLabel").text = "Processing..."
		data = _load_file().split("\n",false)
		get_parent().get_node("TotalMeasurements").text = "Total Measurements: " + data.size() as String
		index = 0
		increases = 0
		processing = true

func _load_file():
	var fileio = load("res://shared/fileio.gd").new()
	return fileio.load_file(file_location)

func _eval_data(index, prev_index):
	if (prev_index < 0):
		get_parent().get_node("Log").text += data[index] as String + " (no previous measurement)\n"
		return

	if (data[prev_index] as int < data[index] as int):
		get_parent().get_node("Log").text += data[index] + " (increased)\n"
		increases += 1
		get_parent().get_node("NumIncreases").text = "# of Increases: " + increases as String
	else:
		get_parent().get_node("Log").text += data[index] + " (decreased)\n"
