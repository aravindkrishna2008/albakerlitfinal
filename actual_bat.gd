extends CharacterBody2D
@onready var character = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var rng = RandomNumberGenerator.new()
var lastKey = false

#@onready var target_node = get_node("res::/amir.tscn")
#var target_position = target_node.global_position
@onready var player = preload("res://amir.tscn")
func _physics_process(delta):
	character.animation = "default"
	# Add the gravity.
	#if not is_on_floor():
		#velocity.y += gravity * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
	print()
	velocity.x = rng.randf_range(-100.0, 100.0)
	#print(player.x)
	#print(PlayerVariables.PlayerX)
	#print(PlayerVariables.PlayerY)
	#print(position.x)
	#if PlayerVariables.PlayerX > position.x:
		#lastKey = true
	#else:
		#lastKey = false
	velocity.y = rng.randf_range(-100.0, 100.0)
	character.flip_h = lastKey;
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	move_and_slide()
