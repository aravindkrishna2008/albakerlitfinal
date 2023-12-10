extends Camera2D

@onready var character_body_2d = $"../AnimatedSprite2D"

# Camera settings
var zoomSpeed = 1.1
var maxZoom = 3.0
var translationSpeed = 300.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Calculate the zoom
	
	enabled = true
	
		
