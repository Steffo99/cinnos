extends Area3D
class_name Trampolino


@export var power: float = 60


func _on_body_entered(body):
	if body is Player:
		body.velocity.y += power
		$Coll/Part.emitting = true
