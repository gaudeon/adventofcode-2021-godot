extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (int) var grid_size = 10001
export (int) var line_spacing = 200
export (int) var line_length = 100_000_000

var horizontal_line_template = preload("res://day_2/HorizontalLine.tscn")
var vertical_line_template = preload("res://day_2/VerticalLine.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(grid_size):
		var pos = (i - floor(grid_size/2)) * line_spacing
		_generate_horizontal_grid_line(pos)
		_generate_vertical_grid_line(pos)
		#_generate_line(0, pos, line_length, 1)


func _generate_horizontal_grid_line(x):
	var line = horizontal_line_template.instance()
	line.set_position(Vector2(0, x))
	line.set_scale(Vector2(line_length, 1))
	add_child(line)

func _generate_vertical_grid_line(x):
	var line = vertical_line_template.instance()
	line.set_position(Vector2(x, 0))
	line.set_scale(Vector2(1, line_length))
	add_child(line)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
