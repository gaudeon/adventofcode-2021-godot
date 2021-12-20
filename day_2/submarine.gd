extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()

var move_queue = []

var tween_running = false

export (Vector2) var relativePosition = Vector2()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = Vector2()
	velocity.x += 10
	velocity = velocity.normalized() * speed
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (move_queue.size() > 0 && tween_running == false):
		var event = move_queue.pop_front()
		var target = Vector2(self.position.x, self.position.y)
		if (event["action"] == "forward"):
			target.x += event["amount"] * speed
			relativePosition.x += event["amount"]
		elif (event["action"] == "up"):
			target.y -= event["amount"] * speed
			relativePosition.y -= event["amount"]
		elif (event["action"] == "down"):
			target.y += event["amount"] * speed
			relativePosition.y += event["amount"]
			
		var tween = get_node("Tween")
		tween.interpolate_property(self, "position",
				self.position, target, 1,
				Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		tween.start()
		tween_running = true


func _on_day_2_move_down(amount):
	move_queue.push_back({
		"action": "down",
		"amount": amount
	})


func _on_day_2_move_forward(amount):
	move_queue.push_back({
		"action": "forward",
		"amount": amount
	})


func _on_day_2_move_up(amount):
	move_queue.push_back({
		"action": "up",
		"amount": amount
	})

func _mark_position():
	var label = PositionLabel.new(self.position, relativePosition)
	
	get_parent().add_child(label)

func _on_Tween_tween_all_completed():
	_mark_position()
	tween_running = false
	
class PositionLabel:
	extends Label
	
	func _init(displayPosition, descriptivePosition):
		self.set_position(displayPosition)
		self.text = "(" + descriptivePosition.x as String + ", " + descriptivePosition.y as String + ")"


