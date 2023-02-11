extends Area2D




func _on_CastleObstacle_body_entered(body):
	body.ouch(position.x)
	body.bounce()
