extends CharacterBody2D
@onready var character = $AnimatedSprite2D

const SPEED = 200.0
const JUMP_VELOCITY = -400.0

var currSpeed = 0.0
var crouch = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var jumpedCount = 0;

var lastKey = false

func _process(delta):
	if PlayerVariables.canMove:
		if (Input.is_action_just_pressed("ui_right")):
			if not crouch:
				character.animation = "prep"
			lastKey = false
		elif (Input.is_action_just_pressed("ui_left")):
			if not crouch:
				character.animation = "prep"
			lastKey = true
		if (position.y > 1200):
			get_tree().reload_current_scene()
			
		if (velocity.y > 0) and not crouch:
			character.animation = "fall"
		character.flip_h = lastKey;

func _physics_process(delta):
	# Add the gravity.
	if PlayerVariables.canMove:
		if (Input.is_action_pressed("ui_down")):
			character.animation = "crouch"
			crouch = true
		else:
			crouch = false
			
		if (velocity.x > 1 || velocity.x < -1 && is_on_floor()) and not crouch:
			character.animation = "running"	
		elif not crouch:
			character.animation = "default"
		
		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction = Input.get_axis("ui_left", "ui_right")
		if direction:
			if crouch:
				velocity.x = move_toward(velocity.x, direction * SPEED / 2, SPEED / 2)
			else:
				velocity.x = move_toward(velocity.x, direction * SPEED, SPEED)
		else:
			if crouch:
				velocity.x = move_toward(velocity.x, 0, SPEED)
			else:
				velocity.x = move_toward(velocity.x, 0, SPEED * 2)	

		if not is_on_floor():
			if PlayerVariables.hasKite and Input.is_action_pressed("ui_up") and velocity.y > 0:
				velocity.y += gravity * delta / 30
				velocity.x *= 1.25
			else:
				velocity.y += gravity * delta
				velocity.x *= 1.1
			if not crouch:
				character.animation = "jump"
		
		if is_on_floor():
			jumpedCount = 0

		# Handle Jump.
		if (Input.is_action_just_pressed("ui_up")) and jumpedCount < 2:
			if crouch:
				velocity.y = JUMP_VELOCITY / 2
			else:
				velocity.y = JUMP_VELOCITY
			jumpedCount +=1
		
		

		

		move_and_slide()
	else:
		character.animation = "default"
