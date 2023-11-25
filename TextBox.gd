extends MarginContainer


func display(s: String, t: float):
	$Panel/HBoxContainer/RichTextLabel.show()
	$Panel/HBoxContainer/RichTextLabel.text = s
	$Timer.start(t)


func _on_timer_timeout():
	$Panel/HBoxContainer/RichTextLabel.hide()
