extends Area3D


@export var text: String
@export var duration: float

@onready var textbox: TextBox = get_tree().root.find_children("TextBox", "TextBox", true, false)[0]


func _on_body_entered(body):
	if body is Player:
		textbox.display(text, duration)
