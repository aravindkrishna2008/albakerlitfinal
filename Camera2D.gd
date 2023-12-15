extends Camera2D

@onready var character_body_2d = $"../AnimatedSprite2D"

# Camera settings
var zoomSpeed = 1.1
var maxZoom = 3.0
var translationSpeed = 300.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_text_submit"):
		zoom.x = 3
		zoom.y = 3
		position_smoothing_speed = 4;
	if Input.is_action_just_released("ui_text_submit"):
		zoom.x = 1
		zoom.y = 1
		position_smoothing_speed = 1;
	
	enabled = true
	
		
