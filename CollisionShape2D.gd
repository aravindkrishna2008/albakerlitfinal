extends CollisionShape2D

func _on_test_body_entered(body):
	queue_free()
