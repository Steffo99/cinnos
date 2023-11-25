extends Area3D
class_name Buccia


func _on_body_entered(body):
	if body is Player:
		body.velocity *= 2
		queue_free()
