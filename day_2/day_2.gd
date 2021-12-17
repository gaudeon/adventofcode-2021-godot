extends Node2D

signal move_forward
signal move_up
signal move_down

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	emit_signal("move_forward", 1)
	emit_signal("move_down", 2)
	emit_signal("move_up", 3)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
