extends Node
class_name GameTimer


var current_time := 0.0

@onready var parent: Label = get_parent()


func _process(delta):
	current_time += delta
	parent.text = "%0.2f" % current_time
