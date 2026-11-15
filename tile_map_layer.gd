extends CharacterBody2D

const SPEED = 300
const JUMP_VELOCITY = -400
# Called when the node enters the scene tree for the first time.
func _physics_process(delta: float) -> void:

	if not is_on_floor():
		velocity += get_gravity() * delta 
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	var direction := Input.get_axis("it_left", "right") # use movement names
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()
