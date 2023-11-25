extends CharacterBody3D
class_name Player


@export var input_accel: float = 1.0
@onready var current_input_accel = input_accel

@onready var gravity_accel: Vector3 = ProjectSettings.get_setting("physics/3d/default_gravity") * ProjectSettings.get_setting("physics/3d/default_gravity_vector")
@export var jump_impulse: Vector3 = Vector3.UP * 100.0;


@export var max_jumps = 1
@onready var current_jumps = max_jumps


func refill_jumps():
	current_jumps = max_jumps


func do_jump():
	current_jumps -= 1
	velocity += jump_impulse



func _physics_process(delta):
	# Refilla salto
	if is_on_floor():
		refill_jumps()
	
	# Rileva salto
	if Input.is_action_just_pressed("jump") and current_jumps > 0:
		do_jump()
	
	# Applica gravità
	velocity += gravity_accel

	# Applica input
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var input_change = input_dir * input_accel
	velocity.x += input_change.x
	velocity.z += input_change.y

	print(velocity)

	move_and_slide()
