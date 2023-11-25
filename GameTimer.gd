extends Node
class_name GameTimer


var current_time := 0.0
var stopped: bool = false

@onready var parent: Label = get_parent()


func _process(delta):
	if not stopped:
		current_time += delta
		parent.text = "%0.2f" % current_time


func _on_dialog_6_body_entered(body):
	if body is Player:
		stopped = true
