extends Area2D

signal shield_collected


func _on_Shield_body_entered(body):
	$AudioStreamPlayer2D.play()
	emit_signal("shield_collected")
	set_collision_mask_bit(0,false)
	$AnimatedSprite.play("pop")

	
	
