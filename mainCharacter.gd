extends CharacterBody2D
@onready var character = $AnimatedSprite2D

const SPEED = 200.0
const JUMP_VELOCITY = -400.0

var currSpeed = 0.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var jumpedCount = 0;


func _physics_process(delta):
	# Add the gravity.
	if (velocity.x > 1 || velocity.x < -1 && is_on_floor()):
		character.animation = "running"
	else:
		character.animation = "default"
		

	if not is_on_floor():
		velocity.y += gravity * delta
	
	if is_on_floor():
		jumpedCount = 0

	# Handle Jump.
	if (Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_accept")) and jumpedCount < 2:
		velocity.y = JUMP_VELOCITY
		character.animation = "jumping"
		jumpedCount +=1
	
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * SPEED, SPEED)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * 2)


	move_and_slide()
	var isLeft = velocity.x < -150
	character.flip_h = isLeft;
