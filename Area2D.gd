extends Area2D
@onready var card = $AnimatedSprite2D
var phase = 0
const SPEED = 200.0
const JUMP_VELOCITY = -400.0
var crouch = false
#func _on_test_area_entered(body):
	#queue_free()
@onready var point_light_2d_2 = $PointLight2D2

func _process(delta):
	if phase == 0:
		card.animation = "default"
	#print(get_overlapping_bodies())
	if len(get_overlapping_bodies()) > 0:
		point_light_2d_2.energy = 0;
	if len(get_overlapping_bodies()) > 0 and Input.is_action_just_pressed("ui_down") and phase == 0:
		PlayerVariables.hasKite = true
		card.animation = "text1"
		position.y= position.y + 150
		phase += 1
		PlayerVariables.canMove = false
		#queue_free()
	elif phase == 1:
		if Input.is_action_just_pressed("ui_down"):
			queue_free()
			PlayerVariables.canMove = true
