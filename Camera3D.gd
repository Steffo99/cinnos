extends Camera3D


@export var target: Node
@onready var offset: Vector3


func _ready():
	offset = position - target.position


func _process(delta):
	position = target.position + offset
