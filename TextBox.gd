extends MarginContainer
class_name TextBox


func display(s: String, t: float):
	show()
	$Panel/HBoxContainer/MarginContainer/RichTextLabel.text = s
	$Timer.start(t)


func _on_timer_timeout():
	hide()
