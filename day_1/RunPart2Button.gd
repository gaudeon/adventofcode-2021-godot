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
		var sum = _generate_three_measurement_sum(index)
		get_parent().get_node("Log").text += sum as String + " (no previous measurement)\n"
		return
	
	# Can't created 3 measurement sums anymore so ignoring the last couple numbers in the list
	if (index+1 >= data.size() || index+2 >= data.size()):
		return
		
	var prev_sum = _generate_three_measurement_sum(prev_index)
	var curr_sum = _generate_three_measurement_sum(index)
	
	if (prev_sum < curr_sum):
		get_parent().get_node("Log").text += curr_sum as String + " (increased)\n"
		increases += 1
		get_parent().get_node("NumIncreases").text = "# of Increases: " + increases as String
	elif (prev_sum == curr_sum):
		get_parent().get_node("Log").text += curr_sum as String + " (no change)\n"
	else:
		get_parent().get_node("Log").text += curr_sum as String + " (decreased)\n"
		
func _generate_three_measurement_sum(index):
	return data[index] as int + data[index+1] as int + data[index+2] as int
