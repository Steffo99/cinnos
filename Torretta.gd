extends StaticBody3D

@onready var player: Player = get_tree().root.find_children("Player", "Player", true, false)[0]


@export var max_distance: float = 30.0
@export var rotation_speed = 0.1
@export var initial_cooldown: float = 0.2

@export var bullet = preload("res://obstacles/bullet.tscn")
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
		
		var diff_x = player.global_position.x - global_position.x
		var diff_z = player.global_position.z - global_position.z
		
		var diff = Vector3(diff_x, 0, diff_z)
		var norm = diff.normalized()
		
		bull.position = global_position
		bull.set_linear_velocity(norm * 50)
		bull.rotation.y = diff.signed_angle_to(Vector3.FORWARD, Vector3.DOWN)
		
		get_tree().root.find_child("Root", true, false).add_child(bull)
		
		cooldown = initial_cooldown
		
	
	
	
