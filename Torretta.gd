extends StaticBody3D

@onready var player: Player = get_tree().root.find_children("Player", "Player", true, false)[0]


@export var max_distance: float = 30.0
@export var rotation_speed = 0.1

var bullet = preload("res://obstacles/bullet.tscn")
var cooldown = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	var distance = player.global_position.distance_to(global_position)
	if distance > max_distance:
		return
	
	rotation.y = (global_position - player.global_position).signed_angle_to(Vector3.FORWARD, Vector3.DOWN) + PI/2
	
	if cooldown > 0:
		cooldown -= delta
	else:
		var bull = bullet.instantiate()
		bull.global_position = global_position
		bull.set_linear_velocity((player.global_position - global_position).normalized() * 50)
		
		get_tree().root.add_child(bull)
		cooldown = 5
		
	
	
	
