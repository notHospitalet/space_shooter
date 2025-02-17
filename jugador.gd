extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var laser_template = preload("res://laser.tscn")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
	#	velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		var laser = laser_template.instantiate()
		laser.global_position = $SpawnerLaser.global_position
		get_parent().add_child(laser)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
